import feedparser
import json
import django
import os
import sys

os.environ['DJANGO_SETTINGS_MODULE']='yourvoice.settings'
sys.path.append(os.path.dirname(os.getcwd()))
django.setup()

from app.models import NigeriaState,LG

if __name__=='__main__':
    f=open('nigeria.json')
    j=json.loads(f.read())
    for i in j:
        state=i['states']['name']
        ngstate=NigeriaState.objects.create(name=state)
        print(state)
        for k in i['states']['locals']:
            lg=k['name']
            LG.objects.create(name=lg,state=ngstate)
            print('------------------------------'+lg)

