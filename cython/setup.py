from setuptools import setup
from Cython.Build import cythonize

setup(name="cython-demo",
      version="1.0.0",
      setup_requires=["Cython>=0.29.0"],
      ext_modules=cythonize("demo.pyx", language_level="3"),
      zip_safe=False
      )
