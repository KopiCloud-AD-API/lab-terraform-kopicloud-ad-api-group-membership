@echo off

echo -----------------------------

echo Test Running [AD Group Membership Create] - Create
cd ad-group-membership-create
copy ..\credentials\terraform.tfvars /y > nul
terraform init -no-color > ..\ad-group-membership-create-result.txt
terraform apply -auto-approve -no-color >> ..\ad-group-membership-create-result.txt
echo Test Running [AD Group Membership Create] - Destroy
echo ----------------------------->> ..\ad-group-membership-create-result.txt
terraform destroy -auto-approve -no-color >> ..\ad-group-membership-create-result.txt
cd ..

echo Test Running [AD Group Membership List] - Create
cd ad-group-membership-list
copy ..\credentials\terraform.tfvars /y > nul
terraform init -no-color > ..\ad-group-membership-list-result.txt
terraform apply -auto-approve -no-color >> ..\ad-group-membership-list-result.txt
echo Test Running [AD Group Membership List] - Destroy
echo ----------------------------->> ..\ad-group-membership-create-result.txt
terraform destroy -auto-approve -no-color >> ..\ad-group-membership-list-result.txt
cd ..

echo -----------------------------

pause