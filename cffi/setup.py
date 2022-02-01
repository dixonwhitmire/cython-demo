from setuptools import setup
setup(
    name="cffi-demo",
    setup_requires=["cffi>=1.15.0"],
    version="1.0.0",
    cffi_modules=["build_awesome.py:ffibuilder"],
    install_requires=["cffi>=1.15.0"],
    zip_safe=False
)
