from django.contrib.auth.models import AbstractUser
from django.db import models


class MemberUser(AbstractUser):
    is_advocacy_member = models.BooleanField(default=False)


class AdvocacyMember(models.Model):
    user = models.OneToOneField(MemberUser, on_delete=models.CASCADE, primary_key=True)

    def __str__(self):
        return self.user.username


class CsWomen(models.Model):
    year = models.IntegerField(primary_key=True)
    num_employees_bls = models.IntegerField(blank=True, null=True)
    num_employees_nsf = models.IntegerField(blank=True, null=True)
    salary_bls = models.IntegerField(blank=True, null=True)
    salary_nsf = models.IntegerField(blank=True, null=True)
    num_recent_grad_employees = models.IntegerField(blank=True, null=True)
    num_recent_grad_nonstem = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cs_women'


class CsMen(models.Model):
    year = models.OneToOneField('CsWomen', models.PROTECT, db_column='year', primary_key=True)
    num_employees_bls = models.IntegerField(blank=True, null=True)
    num_employees_nsf = models.IntegerField(blank=True, null=True)
    salary_bls = models.IntegerField(blank=True, null=True)
    salary_nsf = models.IntegerField(blank=True, null=True)
    num_recent_grad_employees = models.IntegerField(blank=True, null=True)
    num_recent_grad_nonstem = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cs_men'


class RecentGradYears(models.Model):
    year = models.IntegerField(primary_key=True)
    grad_years = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'recent_grad_years'


class Sources(models.Model):
    year = models.IntegerField(primary_key=True)
    num_employees_bls_source = models.CharField(max_length=255, blank=True, null=True)
    num_employees_nsf_source = models.CharField(max_length=255, blank=True, null=True)
    salary_bls_source = models.CharField(max_length=255, blank=True, null=True)
    salary_nsf_source = models.CharField(max_length=255, blank=True, null=True)
    num_recent_grad_employees_source = models.CharField(max_length=255, blank=True, null=True)
    num_recent_grad_nonstem_source = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sources'
