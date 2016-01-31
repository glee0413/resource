#!/usr/bin/env python
#coding: utf-8 or # -*- coding: utf-8 -*-

from django.http import HttpResponse
import time
import datetime

def hello(request):
    now = datetime.datetime.now()
	#ISOTIMEFORMAT='%Y-%m-%d %'
	#now = time.strftime( ISOTIMEFORMAT, time.localtime())

    html = "<html><body>It is now %s.</body></html>" % now	
    
    return HttpResponse(html)

def homepage(request):
	return HttpResponse("homepage")

def hours_ahead(request, offset):
    # try:
    #     offset = int(offset)
    # except ValueError:
    #     raise Http404()
    dt = datetime.datetime.now() + datetime.timedelta(hours=offset)
    html = "<html><body>In %s hour(s), it will be %s.</body></html>" % (offset, dt)
    return HttpResponse(html)