@echo off
cls
echo Clean up Logs
del /q ad*.txt

echo -----------------------------

echo AD Group Membership Create
del /q "ad-group-membership-create\.terraform.lock.hcl"
del /q "ad-group-membership-create\terraform.tfstate.*"
rmdir /s /q "ad-group-membership-create\.terraform"

echo AD Group Membership List
del /q "ad-group-membership-list\.terraform.lock.hcl"
del /q "ad-group-membership-list\terraform.tfstate.*"
rmdir /s /q "ad-group-membership-list\.terraform"

echo -----------------------------

pause