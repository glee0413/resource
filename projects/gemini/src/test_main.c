/*
 * test_main.c
 *
 *  Created on: 2016年5月9日
 *      Author: light
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>

static const char s_video_short_options[] = "d:c:f:h";
static const struct option s_video_long_options[] = {
		{ "device",     required_argument,      NULL,           'd' },
		{ "continue",     required_argument,      NULL,           'c' },
		{ "format",     required_argument,      NULL,           'f' },
};

static void
do_video_test(int argc,char* argv[]){
	int c;

		while ( (c = getopt_long(argc, argv, s_video_short_options, s_video_long_options, NULL)) != -1 ) {
			switch(c){
			case 'd':
				break;
			case 'c':
				break;
			case 'f':
				break;
			default:
				break;
			}
		}
}

int
main(int argc,char* argv[]){
	do_video_test(argc,argv)
	return 0;
}
