

# ~/.databrickscfg [profile] to use
export DATABRICKS_PROFILE=E2DEMO


databricks workspace import \
	/Workspace/Users/douglas.moore@databricks.com/jobs/myjob-file2.py \
	--format AUTO \
	--file ./myjob.py \
	--profile $DATABRICKS_PROFILE \
	--debug


databricks jobs submit --debug \
	--json @./serverless-job2.json \
	--profile $DATABRICKS_PROFILE \
	--debug
