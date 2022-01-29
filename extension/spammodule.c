#define PY_SSIZE_T_CLEAN
#include <Python.h>

const int MAXIMUM_RANDOM_VALUE = 999999;

int generateRandomNumber() {
    return rand() % MAXIMUM_RANDOM_VALUE;
}

/**
 * @brief Demo extension function which is located in a "demo" module.
 * The demo function performs arbitrary calculations and returns a random int.
 *
 * @param self - a pointer to the module or class instance, depending on the implementation.
 * @param args - a pointer to the function arguments stored as a tuple,
 */
static PyObject * spam_demo(PyObject *self, PyObject *args) {
    int result = 0;
    int numCalculations = 0;
    int ok = PyArg_ParseTuple(args, "i", &numCalculations);

    if (!ok) {
        return NULL;
    }

    for (int i = 0; i < numCalculations; i++) {
        int a = generateRandomNumber();
        int b = generateRandomNumber();
        result = a + b;
    }

    result = generateRandomNumber();
    return PyLong_FromLong(result);
}

// module method table
// defines the function, c implementation, and how it's invoked (args, kwargs, etc)
static PyMethodDef SpamMethods [] = {
    {"demo", spam_demo, METH_VARARGS, "Python Demo Extension Method"},
    {NULL, NULL, 0, NULL}
};

// module definition
// binds functions/callables to a module
static struct PyModuleDef spammodule = {
    PyModuleDef_HEAD_INIT,
    "spam",
    "Python Interface for C Extension Methods",
    -1,
    SpamMethods
};

PyMODINIT_FUNC PyInit_spam(void) {
    return PyModule_Create(&spammodule);
}
