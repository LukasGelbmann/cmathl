#include <stdlib.h>
#include "includes/cml.h"


CML_EXTERN_INLINE bool
__isinteger(double x)
{
        int x_int = (int) x;
        return ((x - x_int) == 0);
}

bool
real_isinteger(real x)
{
        return __isinteger(x->value(x));
}
