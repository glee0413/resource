/*
 * v4l_capture.h
 *
 *  Created on: 2016年5月9日
 *      Author: light
 */

#ifndef SRC_DEVICE_VIDEO_V4L_CAPTURE_H_
#define SRC_DEVICE_VIDEO_V4L_CAPTURE_H_

enum CAPTURE_FORMAT{
	CF_JPEG = 0,
	CF_BMP,
	CF_MAX,
};

struct video_capture{
	char 	m_device_name[56];
	int 		m_format;
	int 		m_device_fd;
	void		(*init)();
	void		(*open)();
	void 	(*start)();
	void		(*get_one_frame)();
	void		(*uninit)();
	void		(*close)();
};

extern struct video_capture* create_video_capture_inst(const char* dev_name,int format);

#endif /* SRC_DEVICE_VIDEO_V4L_CAPTURE_H_ */
