/*
 * v4l_capture.c
 *
 *  Created on: 2016年5月9日
 *      Author: light
 */

#include "v4l_capture.h"

struct video_capture* create_video_capture_inst(const char* dev_name,int format);{
	struct video_capture* video_inst = NULL;
	video_inst = malloc(sizeof(struct video_capture));
	if(video_inst == NULL){
		return NULL;
	}
	return video_inst;
}
