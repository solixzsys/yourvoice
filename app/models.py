from django.db import models
import hashlib
from datetime import datetime
from ckeditor.fields import RichTextField
# Create your models here.
from django.db.models.signals import pre_save
from django.db.models.signals import pre_init
from django.db.models.signals import post_init
from django.db.models.signals import post_save
from django.db.models.signals import post_delete
from django.dispatch import receiver
import random
import string
from django.contrib.auth.models import User
from extended_flatpages.models import CMSFlatPage
from datetime import datetime


class StoryFlatPage(CMSFlatPage):
    DOMAIN=(
        ('ECONOMY','Economy'),
        ('POLITICS','Politics'),
        ('SOCIAL','Social'),

    )
    STATE=(
        ('DRAFT','DRAFT'),        
        ('UNPUBLISH','UNPUBLISH'),
        ('PUBLISH','PUBLISH'),
        ('COMPLETE','COMPLETE'),
        ('END-OF-LIFE','END-OF-LIFE'),
    )

    story_is_hero=models.BooleanField(default=False)
    story_hero_image=models.FileField(upload_to='passport/%Y/%m/%d',blank=True)
    story_domain=models.CharField(max_length=20,choices=DOMAIN)
    story_status=models.CharField(max_length=20,choices=STATE,default="DRAFT")
    story_date=models.DateField(default= datetime.now())

    def save(self, *args, **kwargs):
        self.url='/'+self.title.replace(' ','-')+'/'
        return super(StoryFlatPage,self).save(*args, **kwargs)



class SurveyTag(models.Model):
    
    DOMAIN=(
        ('ECONOMY','Economy'),
        ('POLITICS','Politics'),
        ('SOCIAL','Social'),

    )
    STATE=(
        ('DRAFT','DRAFT'),        
        ('UNPUBLISH','UNPUBLISH'),
        ('PUBLISH','PUBLISH'),
        ('COMPLETE','COMPLETE'),
        ('END-OF-LIFE','END-OF-LIFE'),

    )

    surveytag_title=models.TextField()
    surveytag_description=RichTextField()
    surveytag_tag=models.CharField(max_length=100,default="")
    surveytag_date=models.DateField()
    surveytag_owner=models.ForeignKey(User,default="")
    surveytag_domain=models.CharField(max_length=20,choices=DOMAIN)
    surveytag_status=models.CharField(max_length=20,choices=STATE,default="DRAFT")

    def __str__(self):
        return self.surveytag_title

        
    def save(self, *args, **kwargs):
        self.surveytag_tag=str(''.join([random.choice(string.ascii_letters+string.digits) for n in range(32)]))
        return super(SurveyTag,self).save(*args, **kwargs)



class PollOption(models.Model):
    # polloption_question=models.ForeignKey(Poll,default="")
    polloption_text=models.TextField()
    polloption_questioncode=models.CharField(max_length=50,default="")
    polloption_code=models.CharField(max_length=200,default="")
    polloption_score=models.IntegerField(default=0)
    polloption_questiontitle=models.CharField(max_length=50,default="")
    def __str__(self):
        return self.polloption_text

    def save(self, *args, **kwargs):
        
        
        self.polloption_code=str(''.join([random.choice(string.ascii_letters+string.digits) for n in range(32)]))
        # self.polloption_questioncode=self.polloption_question.poll_code
        return super(PollOption,self).save(*args, **kwargs)

        


class Poll(models.Model):
    DOMAIN=(
        ('ECONOMY','Economy'),
        ('POLITICS','Politics'),
        ('SOCIAL','Social'),

    )
    STATE=(
        ('PUBLISH','PUBLISH'),
        ('UNPUBLISH','UNPUBLISH'),

    )

    poll_code=models.CharField(max_length=20)
    poll_title=models.CharField(max_length=50,help_text="Short description that identify the question",default="")
    poll_question=RichTextField()
    poll_domain=models.CharField(max_length=20,choices=DOMAIN)
    poll_date=models.DateField()
    poll_state=models.CharField(max_length=20,choices=STATE,default="UNPUBLISH")
    poll_author=models.ForeignKey(User,default=None)
    poll_surveytag=models.ForeignKey(SurveyTag,default=None,blank=True)
    # poll_options=models.ManyToManyField(PollOption,default="")

    def __str__(self):
        return self.poll_title

    # def save(self, *args, **kwargs):
    #     question=self.poll_question
    #     hash_object=hashlib.md5(question.encode())
    #     self.poll_code=str(hash_object.hexdigest())
    #     return super(Poll,self).save(*args, **kwargs)
            


# @receiver(pre_save,sender=Poll)
# def myhandler(sender,instance,**kwargs):
#     # print("Saving Object ................................................" + str(kwargs))
#     question=instance.poll_question
#     hash_object=hashlib.md5(question.encode())
#     instance.poll_code=str(hash_object.hexdigest())
#     # return super(Poll,self).save(*args, **kwargs)

# @receiver(post_save,sender=Poll)
# def myhandler2(sender,instance,**kwargs):
#     pass
#     if kwargs['created']:
        
#         print("saved Object ................................................" + str(kwargs))    


@receiver(post_delete,sender=Poll)
def myhandler2(sender,instance,**kwargs):       
    print("Deleted Object ................................................" + str(instance)) 
    obj_code=instance.poll_code
    PollOption.objects.filter(polloption_questioncode=obj_code).delete()   


