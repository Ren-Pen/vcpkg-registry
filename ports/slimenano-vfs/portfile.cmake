vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Ren-Pen/slimenano-vfs
    REF "v${VERSION}"
    SHA512 failing download because the expected SHA512 was all zeros, please change the expected SHA512 to: 96e06973e2d34846027efd32a8a4d73d1c24b8b64d2e60de4e80ab49bb73d81df3305896747c267a1e76bcc73844196aa76fa66a2fcf1abeeefc136f0479e2ba
    HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DSLIMENANO_VFS_BUILD_TESTS=OFF
        -DSLIMENANO_VFS_BUILD_DEMO=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME slimenano_vfs
    CONFIG_PATH lib/cmake/slimenano_vfs
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")