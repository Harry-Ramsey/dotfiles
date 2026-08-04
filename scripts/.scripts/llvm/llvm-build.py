#!/usr/bin/env python3
from pathlib import Path
import argparse
import subprocess
import sys
import os

def main():
    parser = argparse.ArgumentParser(description="Configure and build LLVM.")
    parser.add_argument(
        "--src-dir",
        nargs="?",
        default=f"{os.getenv('HOME')}/repos/llvm-project.git/llvm",
        help="LLVM source directory",
    )
    parser.add_argument(
        "--build-dir",
        nargs="?",
        default=f"{os.getenv('HOME')}/repos/llvm-project.git/build",
        help="LLVM build directory",
    )
    parser.add_argument(
        "--enabled-projects",
        nargs="?",
        default="clang;lld",
        help="LLVM projects to enable",
    )
    parser.add_argument(
        "--enabled-runtimes",
        nargs="?",
        default="libc;libcxx;libcxxabi;libunwind",
        help="LLVM runtimes to enable",
    )
    parser.add_argument(
        "--targets",
        nargs="?",
        default="AArch64",
        help="LLVM targets to enable"
    )
    args = parser.parse_args()

    build_dir = Path(args.build_dir)
    build_dir.mkdir(parents=True, exist_ok=True)

    cmake_cmd = [
        "cmake",
        "-G",
        "Ninja",
        "-S",
        f"{args.src_dir}",
        "-DCMAKE_BUILD_TYPE=Debug",
        f"-DLLVM_ENABLE_PROJECTS={args.enabled_projects}",
        f"-DLLVM_ENABLE_RUNTIMES={args.enabled_runtimes}",
        f"-DLLVM_TARGETS_TO_BUILD={args.targets}",
        "-DLLVM_USE_LINKER=lld",
        "-DBUILD_SHARED_LIBS=ON",
        "-DLLVM_ENABLE_ASSERTIONS=ON",
    ]

    try:
        subprocess.run(cmake_cmd, cwd=build_dir, check=True)
        subprocess.run(["ninja"], cwd=build_dir, check=True)
    except subprocess.CalledProcessError as e:
        sys.exit(e.returncode)

if __name__ == "__main__":
    main()
