from setuptools import setup, Extension

setup(
    name="c-extension-demo",
    version="1.0.0",
    ext_modules=[Extension("spam", ["spammodule.c"])]
)
