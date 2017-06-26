from django.shortcuts import render
from app.models import *
from django.http import JsonResponse,HttpResponse
from django.core import serializers
# Create your views here.


def result(request):
    pages=StoryFlatPage.objects.all()
    hero=StoryFlatPage.objects.filter(story_is_hero=True)[0]
    return render(request,'result.html',{'pages':pages,'hero':hero})



def index(request):
    polls_dict={}
    poll_object = Poll.objects.all()
    # for obj in poll_object:
    #     polls_dict[obj.poll_question]=PollOption.objects.filter(polloption_questioncode=obj.poll_code)
   



    return render(request,'index.html',{'obj':poll_object})

def test(request):
    polls_dict={}
    poll_object = Poll.objects.all()
    # for obj in poll_object:
    #     polls_dict[obj.poll_question]=PollOption.objects.filter(polloption_questioncode=obj.poll_code)
   



    return render(request,'test.html',{'obj':poll_object})
    

def jsonpoll(request):
    
    page=request.GET.get('page')
    section=request.GET.get('section').upper()
    # print('ppppppppppppppppppp'+str(page))
    if(section=='ECONOMY'):
        
        poll_object = Poll.objects.filter(poll_domain=section)[int(page)]
        print('...........................'+str(poll_object))
    else:
        poll_object = Poll.objects.all()[int(page)]     
    serialized=serializers.serialize('json',[poll_object])
    
    return HttpResponse(serialized,content_type='application/json')



def jsonoption(request):
    
    code=request.GET.get('code')
    # print('cccccccccccccccccccccccccccccccccccccc'+str(code))

    polloption_object=PollOption.objects.filter(polloption_questioncode=code)
    serialized=serializers.serialize('json',polloption_object)
    # print(serialized)
    return HttpResponse(serialized,content_type='application/json')
    
