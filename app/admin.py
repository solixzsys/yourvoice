from django.contrib import admin
from app.models import Poll,PollOption
from django import forms
# Register your models here.
import random
import string
import hashlib
class PollForm(forms.ModelForm):
    Option1=forms.CharField(max_length=200,required=False)
    Option2=forms.CharField(max_length=200,required=False)
    Option3=forms.CharField(max_length=200,required=False)
    Option4=forms.CharField(max_length=200,required=False)
    class Meta:
        model=Poll
        fields='__all__'



class PollAdmin(admin.ModelAdmin):
    form=PollForm
    list_display=('poll_title','poll_date','poll_domain','poll_state','poll_author','poll_code',)
    exclude=('poll_code',)
    list_filter=('poll_domain','poll_state','poll_date','poll_author')
    search_fields=['poll_title','poll_question']

    # fieldsets=(
    #     (None,{
    #         'fields':(('poll_title','poll_domain','poll_date'),'poll_question')
    #     }),
    #     ('Options',{
    #         'classes': ('collapse',),
    #         'fields':('Option1','Option2','Option3','Option4')
    #     }),
    # )


    def get_form(self, request, obj=None, **kwargs):
       
        # self.fieldsets=tuple(self.fieldsets[0])
        
        # print('Inside get_form............... obj'+str(tuple(self.fieldsets[0])))
        if obj is None:
            kwargs['form'] = PollForm

            self.fieldsets=(
                    (None,{
                        'fields':(('poll_title','poll_domain','poll_date'),'poll_question')
                    }),
                    ('Options',{
                        'classes': ('collapse',),
                        'fields':('Option1','Option2','Option3','Option4')
                    }),
             )

        else:
            
            self.fieldsets=(
                    (None,{
                        'fields':(('poll_title','poll_domain','poll_date'),'poll_question')
                    }),
                    
            )
                 
        return super(PollAdmin, self).get_form(request, obj, **kwargs)


    def save_model(self, request, obj, form, change,**kwargs):
        print('change......................... '+str(change))
        if (change==False):
            print('inside change................................')
            question=obj.poll_question
            title=obj.poll_title
            hash_object=hashlib.md5(question.encode())
            code=str(hash_object.hexdigest())
            obj.poll_code=code

            code=obj.poll_code   
            title=obj.poll_title 
            option1=form.cleaned_data.get('Option1',None)
            option2=form.cleaned_data.get('Option2',None)
            option3=form.cleaned_data.get('Option3',None)
            option4=form.cleaned_data.get('Option4',None)

            obj.poll_author=request.user    
            
            if(option1 != ""):
                PollOption.objects.create(polloption_text=option1,polloption_questioncode=code,polloption_questiontitle=title, polloption_code=str(''.join([random.choice(string.ascii_letters+string.digits) for n in range(32)])))
            if(option2 !=""):
                PollOption.objects.create(polloption_text=option2,polloption_questioncode=code,polloption_questiontitle=title, polloption_code=str(''.join([random.choice(string.ascii_letters+string.digits) for n in range(32)])))
            if(option3 !="")   : 
                PollOption.objects.create(polloption_text=option3,polloption_questioncode=code,polloption_questiontitle=title, polloption_code=str(''.join([random.choice(string.ascii_letters+string.digits) for n in range(32)])))
            if(option4 !=""):
                PollOption.objects.create(polloption_text=option4,polloption_questioncode=code,polloption_questiontitle=title, polloption_code=str(''.join([random.choice(string.ascii_letters+string.digits) for n in range(32)])))
        return super().save_model(request, obj, form, change)


    def delete_model(self,request,obj):
        print(str(obj) +' is deleted.........................')
    def change_view(self,request,object_id,extra_context=None):
        print('inside change_view ................................')
        self.exclude=('Option1','Option2','Option3','Option4',)
        return super(PollAdmin,self).change_view(request,object_id,extra_context=None)
            
    def get_fields(self,request,obj):
        print('Getting fields ................................')
        fields=super(PollAdmin,self).get_fields(request,obj)
        if obj:
            fields.remove('Option1')
            fields.remove('Option2')
            fields.remove('Option3')
            fields.remove('Option4')    
        return fields




admin.site.register(Poll,PollAdmin)

class PollOptionAdmin(admin.ModelAdmin):
    list_display=('polloption_text','polloption_score','polloption_questiontitle','polloption_questioncode','polloption_code',)
    exclude=('polloption_questioncode','polloption_code','polloption_score')
    list_filter=('polloption_questiontitle',)
    search_fields=['polloption_questiontitle']

admin.site.register(PollOption,PollOptionAdmin)    