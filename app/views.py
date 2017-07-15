from django.shortcuts import render,redirect
from django.contrib.auth import authenticate,login
from app.models import *
from django.http import JsonResponse,HttpResponse,HttpResponseRedirect
from django.core import serializers
from django.contrib.auth.decorators import login_required
from app.forms import *
from django.contrib.auth.models import User
import json
from django.db import transaction
from ipware.ip import get_real_ip
import random
# Create your views here.



def signup(request):
    if request.method == 'POST':
        
        user_form = UserForm(request.POST)
        profile_form = ProfileForm(request.POST)
        print('posting...............')
        
        if user_form.is_valid() and profile_form.is_valid() :
            print('form valid..........................')
            user=user_form.save(False)
            user.username=user_form.cleaned_data.get('email')
            user.set_password(user_form.cleaned_data.get('password'))
            user.save()
            user.refresh_from_db()
            profile_form=ProfileForm(request.POST,instance=user.profile)
            profile_form.full_clean()
            profile_form.save()
            # messages.success(request, _('Your profile was successfully updated!'))
            user=authenticate(username=user_form.cleaned_data.get('email'),password= user_form.cleaned_data.get('password'))
            if user is not None:
                print('authenticate.........................')
                login(request,user)
            # user.profile.birth_date=user_f
            # return redirect('settings:profile')

                return HttpResponseRedirect('/')
        else:
            print('problem........................')
            
    else:
        print('problem........................')
        user_form = UserForm()
        profile_form = ProfileForm()
    return render(request, 'registration/signup.html', {
        'user_form': user_form,
        'profile_form': profile_form
    })



@login_required
# @transaction.atomic
def update_profile(request):
    if request.method == 'POST':
        user_form = UserForm(request.POST, instance=request.user)
        profile_form = ProfileForm(request.POST, instance=request.user.profile)
        # if user_form.is_valid() and profile_form.is_valid():
        if profile_form.is_valid():
            # user=user_form.save(False)
            email=user_form.data.get('email')
            # print('uuuuuuuuuuuuuuuuuuuuuuuuu '+username)

            firstname=user_form.data.get('first_name')
            lastname=user_form.data.get('last_name')
            u=User.objects.get(email=email)
            u.username=email
            if firstname != "":
                u.first_name=firstname
            if lastname != "":    
                u.last_name=lastname
            u.save()
            # user.set_password(user_form.cleaned_data.get('password'))
            # user.save()
            profile_form.save()
        #     messages.success(request, _('Your profile was successfully updated!'))
            return redirect('/')
        # else:
        #     messages.error(request, _('Please correct the error below.'))
    else:
        # UserForm().pop('password')
        user_form = UserForm(instance=request.user)
        user_form.fields.pop('password')
        user_form.fields.pop('confirm_password')
        # print(user_form.fields)
        
        profile_form = ProfileForm(instance=request.user.profile)
    return render(request, 'profiles/profile.html', {
        'user_form': user_form,
        'profile_form': profile_form
    })



def result(request):
    pages=StoryFlatPage.objects.all()
    hero=StoryFlatPage.objects.filter(story_is_hero=True)[0]
    return render(request,'result.html',{'pages':pages,'hero':hero})

def result_detail(request):
    story_id=request.GET.get('story')
    page=StoryFlatPage.objects.get(pk=story_id)
    return render(request,'result_detail.html',{'page':page})


def about(request):
    
    return render(request,'about.html',{})
def ourteam(request):
    
    return render(request,'team.html',{})

def services(request):
    
    return render(request,'services.html',{})

def index(request):
    polls_dict={}
    poll_object = Poll.objects.filter(poll_state='PUBLISH')
    user=request.user
    print('uuuuuuuuuuuuuuuuuuu+'+user.username)
    # for obj in poll_object:
    #     polls_dict[obj.poll_question]=PollOption.objects.filter(polloption_questioncode=obj.poll_code)
   



    return render(request,'index.html',{'obj':poll_object,'user':user})

def index2(request):
    

    polls_dict={}
    poll_object = Poll.objects.filter(poll_state='PUBLISH')
    for obj in poll_object:
        polls_dict[obj.poll_question]=PollOption.objects.filter(polloption_questioncode=obj.poll_code)
   



    return render(request,'index3.html',{'objccc':poll_object})    

def test(request):
    polls_dict={}
    poll_object = Poll.objects.all()
    # for obj in poll_object:
    #     polls_dict[obj.poll_question]=PollOption.objects.filter(polloption_questioncode=obj.poll_code)
   



    return render(request,'test.html',{'obj':poll_object})
    

def jsonpoll(request):
    print('Inside jsonpoll................................')
    page=request.GET.get('page')
    stag=request.GET.get('stag')


    print('ppppppppppppppppppp'+str(page))
    # if(section=='ECONOMY'):
        
    #     poll_object = Poll.objects.filter(poll_domain=section,poll_surveytag__surveytag_status='PUBLISH')[int(page)]
    #     print('...........................'+str(poll_object))
    # else:
    #     poll_object = Poll.objects.filter(poll_surveytag__surveytag_status='PUBLISH')[int(page)]  

    s= SurveyTag.objects.get(surveytag_tag=stag)
    try:
        poll_object=Poll.objects.filter(poll_surveytag=s)[int(page)]
        serialized=serializers.serialize('json',[poll_object])

    
    except:
        poll_object=""   
        print('poll exceeded................................'+serialized) 
        serialized=serializers.serialize('json',[poll_object])
        
    
    
    print(serialized)
    return HttpResponse(serialized,content_type='application/json')



def jsonoption(request):
    
    code=request.GET.get('code')
    print('cccccccccccccccccccccccccccccccccccccc'+str(code))

    polloption_object=PollOption.objects.filter(polloption_questioncode=code)
    serialized=serializers.serialize('json',polloption_object)
    # print(serialized)
    return HttpResponse(serialized,content_type='application/json')
    

def surveycount(request):
    
    surveycount=SurveyTag.objects.filter(surveytag_status='PUBLISH').count()

    # serialized=serializers.serialize('json',[{'surveycount':surveycount}])
    # print(str(surveycount)+' #################################')
    return HttpResponse(json.dumps({'surveycount':surveycount}),content_type='application/json')

@transaction.atomic    
def incrementscore(request):
    
    tag=request.GET.get('tag')
    option=PollOption.objects.get(polloption_code=tag)
    option.polloption_score=option.polloption_score+1
    option.save()
    options=PollOption.objects.filter(polloption_questioncode=option.polloption_questioncode)
    print('sameoption ----- '+str(options[0].polloption_score))

    ip=get_real_ip(request)
    print('ip---------------'+str(request.META))
    try:
        user=request.user
        useroption=UserPollOption.objects.create(user=request.user,option=option,ipaddress=ip)
    except:
        user="Anonymous"


        useroption=UserPollOption.objects.create(user=User.objects.get(username='Anonymous'),option=option,ipaddress=ip)
    serialized=serializers.serialize('json',options)
    # return HttpResponse(json.dumps({'score':option.polloption_score}),content_type='application/json')
    return HttpResponse(serialized,content_type='application/json')





def dynamictemp(request):
    ques=[]
    options=[]
    stag=SurveyTag.objects.filter(surveytag_status='PUBLISH')
    # for tag in stag:
    #     ques=Poll.objects.filter(poll_surveytag=tag)
    #     ques.append(tag)

    serialized=serializers.serialize('json',stag)
    
    return HttpResponse(serialized,content_type='application/json')

def getQuotes(request):
    quotes=Quotes.objects.all()
    quotes=random.sample(list(quotes),len(quotes))

    serialized=serializers.serialize('json',quotes)

    # print('quote------ '+serialized)
    return HttpResponse(serialized,content_type='application/json')

def getfeed(request):
    feed=MyFeed.objects.all()
    

    serialized=serializers.serialize('json',feed)

    # print('quote------ '+serialized)
    return HttpResponse(serialized,content_type='application/json')    

def getpolls(request):
    polls= random.sample(list( Poll.objects.all()),2)    
    serialized=serializers.serialize('json',polls)

    #print('quote------ '+serialized)
    return HttpResponse(serialized,content_type='application/json')



def getsurvey(request):
    num=request.GET.get('num')
    survey=SurveyTag.objects.get(pk=num)
    

    serialized=serializers.serialize('json',[survey])

    # print('quote------ '+serialized)
    return HttpResponse(serialized,content_type='application/json')    
    

def mypolls(request):

    return render(request,'allpolls.html',{'user':request.user})    

def loadstate(request):
    state=NigeriaState.objects.all()

    serialized=serializers.serialize('json',state)

    
    return HttpResponse(serialized,content_type='application/json') 
def getlg(request):
    state=request.GET.get('state')
    lg=LG.objects.filter(state=NigeriaState.objects.get(name=state))

    serialized=serializers.serialize('json',lg)

    
    return HttpResponse(serialized,content_type='application/json')     

def adminchart(request,id):
    id=request.GET.get('pk')
    tag=SurveyTag.objects.get(pk=int(id))
    polls = Poll.objects.filter(poll_surveytag=tag)
    serialized=serializers.serialize('json',polls)
    # print('pppppppp...............'+serialized)



    return render(request,'chart.html',{'polls':polls})