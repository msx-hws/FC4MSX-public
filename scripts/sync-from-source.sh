#!/usr/bin/env bash
# ==============================================================================
# sync-from-source.sh
#
# Synchronizes public release assets into FC4MSX-public from the upstream
# hardware repository (FC4MSX).
#
# SAFETY POLICY:
# - By default, this script checks out and syncs ONLY from tag 'v1.0.3'.
# - It will NEVER sync unreleased development branches (v2.0.0+ / develop)
#   unless an explicit tag or revision is specified AND verified.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PUBLIC_REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SOURCE_REPO="${1:-/Volumes/Data/msx/hardware/FC4MSX}"
TARGET_TAG="${2:-v1.0.3}"

echo "=== FC4MSX Public Sync Utility ==="
echo "Public Repo Target: ${PUBLIC_REPO_ROOT}"
echo "Source Repo:        ${SOURCE_REPO}"
echo "Requested Target:   ${TARGET_TAG}"
echo "=================================="

# 1. Validate source repository exists and is a git repository
if [[ ! -d "${SOURCE_REPO}/.git" ]]; then
    echo "ERROR: Source repository not found at '${SOURCE_REPO}'" >&2
    exit 1
fi

# 2. Strict Version Safety Check
# Prevent accidental syncing of master/main/develop or unapproved v2 versions
if [[ "${TARGET_TAG}" == "develop" || "${TARGET_TAG}" == "main" || "${TARGET_TAG}" =~ ^v?2.* ]]; then
    if [[ "${ALLOW_UNTESTED_V2:-0}" != "1" ]]; then
        echo "ERROR: Refusing to sync '${TARGET_TAG}'!" >&2
        echo "v2.0.0+ hardware is untested and not approved for the public release repo." >&2
        echo "To override intentionally, run with: ALLOW_UNTESTED_V2=1 $0 ${SOURCE_REPO} ${TARGET_TAG}" >&2
        exit 1
    else
        echo "WARNING: ALLOW_UNTESTED_V2 is set. Syncing '${TARGET_TAG}'..." >&2
    fi
fi

# 3. Verify target tag/commit exists in source repository
if ! git -C "${SOURCE_REPO}" rev-parse --verify "${TARGET_TAG}" >/dev/null 2>&1; then
    echo "ERROR: Target '${TARGET_TAG}' does not exist in ${SOURCE_REPO}" >&2
    exit 1
fi

SOURCE_COMMIT=$(git -C "${SOURCE_REPO}" rev-parse --short "${TARGET_TAG}")
echo "==> Source pinned to: ${TARGET_TAG} (${SOURCE_COMMIT})"

# 4. Check for uncommitted changes in public repo
if ! git -C "${PUBLIC_REPO_ROOT}" diff --quiet || ! git -C "${PUBLIC_REPO_ROOT}" diff --cached --quiet; then
    echo "ERROR: Public repo has uncommitted changes. Please commit or stash first." >&2
    exit 1
fi

# 5. Extract files safely using git archive from pinned target
TMP_DIR=$(mktemp -d)
trap 'rm -rf "${TMP_DIR}"' EXIT

echo "==> Extracting files from ${TARGET_TAG}..."
git -C "${SOURCE_REPO}" archive "${TARGET_TAG}" | tar -x -C "${TMP_DIR}"

echo "==> Syncing public-safe assets..."

# Documentation & PDF
if [[ -f "${TMP_DIR}/FC4MSX.pdf" ]]; then
    mkdir -p "${PUBLIC_REPO_ROOT}/docs"
    cp "${TMP_DIR}/FC4MSX.pdf" "${PUBLIC_REPO_ROOT}/docs/FC4MSX-Schematic.pdf"
fi

# 3D Enclosure Models & STL previews (exclude OpenSCAD proprietary sources)
if [[ -d "${TMP_DIR}/3d-enclosure" ]]; then
    mkdir -p "${PUBLIC_REPO_ROOT}/3d-enclosure"
    find "${TMP_DIR}/3d-enclosure" -type f \( -name "*.stl" -o -name "*.3mf" -o -name "*.png" -o -name "*.md" \) \
        -exec cp {} "${PUBLIC_REPO_ROOT}/3d-enclosure/" \;
fi

# Images / Renders
if [[ -d "${TMP_DIR}/images" ]]; then
    mkdir -p "${PUBLIC_REPO_ROOT}/images"
    cp -R "${TMP_DIR}/images/"* "${PUBLIC_REPO_ROOT}/images/" 2>/dev/null || true
fi

for img in FC4MSX-top.png FC4MSX-bottom.png FC4MSX-bare.png; do
    if [[ -f "${TMP_DIR}/${img}" ]]; then
        cp "${TMP_DIR}/${img}" "${PUBLIC_REPO_ROOT}/images/"
    fi
done

# BOM
if [[ -f "${TMP_DIR}/FC4MSX-bom.csv" ]]; then
    mkdir -p "${PUBLIC_REPO_ROOT}/bom"
    cp "${TMP_DIR}/FC4MSX-bom.csv" "${PUBLIC_REPO_ROOT}/bom/"
fi
if [[ -f "${TMP_DIR}/bom/ibom.html" ]]; then
    mkdir -p "${PUBLIC_REPO_ROOT}/bom"
    cp "${TMP_DIR}/bom/ibom.html" "${PUBLIC_REPO_ROOT}/bom/"
fi

# ROM binaries
if [[ -d "${TMP_DIR}/rom" ]]; then
    mkdir -p "${PUBLIC_REPO_ROOT}/rom"
    find "${TMP_DIR}/rom" -type f \( -name "*.ROM" -o -name "*.rom" -o -name "*.md" \) \
        -exec cp {} "${PUBLIC_REPO_ROOT}/rom/" \;
fi

# Gerbers (loose files only; zip packages remain managed in /releases)
if [[ -d "${TMP_DIR}/gerbers" ]]; then
    mkdir -p "${PUBLIC_REPO_ROOT}/gerbers"
    find "${TMP_DIR}/gerbers" -type f ! -name "*.zip" \
        -exec cp {} "${PUBLIC_REPO_ROOT}/gerbers/" \;
fi

echo "==> Sync complete from ${TARGET_TAG}."
git -C "${PUBLIC_REPO_ROOT}" status --short
