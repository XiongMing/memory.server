#ifndef _MEM_WEB_H
#define _MEM_WEB_H
#include "mongoose.h"

class mem_web
{
public:
	mem_web();
	~mem_web();

public:
	/* start memory web server */
	int start_web();
	/* stop memory web server */
	int stop_web();
};

#endif /* end of _MEM_WEB_H */