from django.shortcuts import render
from app.models import *
from django.http import JsonResponse,HttpResponse
from django.core import serializers
# Create your views here.

def index(request):
    polls_dict={}
    poll_object = Poll.objects.all()
    # for obj in poll_object:
    #     polls_dict[obj.poll_question]=PollOption.objects.filter(polloption_questioncode=obj.poll_code)
   



    return render(request,'test.html',{'obj':poll_object})


def jsonpoll(request):
    
    page=request.GET.get('page')
    print('ppppppppppppppppppp'+str(page))
    poll_object = Poll.objects.all()[int(page)]
         
    serialized=serializers.serialize('json',[poll_object])
         
    return HttpResponse(serialized,content_type='application/json')



def jsonoption(request):
    
    code=request.GET.get('code')
    print('cccccccccccccccccccccccccccccccccccccc'+str(code))

    polloption_object=PollOption.objects.filter(polloption_questioncode=code)
    serialized=serializers.serialize('json',polloption_object)
    print(serialized)
    return HttpResponse(serialized,content_type='application/json')
    
