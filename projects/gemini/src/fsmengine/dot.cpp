/*
 * main.cpp
 *
 *  Created on: 2016年6月18日
 *      Author: light
 *      Mail: glee-0413@163.com
 */
#include <stdio.h>
#include "gvc.h"

static const char s_dot_file[] ="./fsm.dot";

int
main(int argc,char* argv[]){
	GVC_t *gvc;
	graph_t *g;
	FILE *fp;
	Agnode_t* np;
	Agedge_t *ep;

	gvc = gvContext();
	fp = fopen(s_dot_file, "r");
	if(!fp)
		return 0;

	g = agread(fp, 0);
	if(!g){
		printf("parse file failed");
		return 0;
	}

	if(agisdirected(g)){
		printf("is directed\n");
	}

	int ne = agnedges(g);
	int nv = agnnodes(g);
	char lable[56] = {0};
	printf("graph:%s : nodes :%d,edges :%d\n",agnameof(g),nv,ne);
	//NODE
	for (np = agfstnode (g); np; np = agnxtnode (g, np)) {
		printf("node :%s ---",agnameof(np));
		for (ep = agfstedge(g, np); ep; ep = agnxtedge(g, ep, np)){
			Agnode_t *tp = agtail(ep);
			Agnode_t *hp = aghead(ep);
//			if(ED_tail_label(ep)){
//				textlabel_t *lp = ED_tail_label(ep);
//				strcpy(lable,lp->text);
//			}else{
//				lable[0] = 0;
//			}
			printf("edge :(%s -> %s,lable :%s);",agnameof(tp),agnameof(hp),agget(ep,"label"));

		}
		printf("\n");
	}

	agclose(g);
	return (gvFreeContext(gvc));
}



