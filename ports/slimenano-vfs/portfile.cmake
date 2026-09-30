vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Ren-Pen/slimenano-vfs
    REF "v${VERSION}"
    SHA512 2cf057b146d1c11407a1315aec283fa580c80f59b40f6d5c76602658d8e5020a5c8a2f4b55203d8e229eccbb709588f2d37502ec6d8fa0ef2a14e7d96b6c4d0b
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
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