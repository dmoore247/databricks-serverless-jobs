# Submit serverless job example

### job-submit.sh:
```sh
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
```

### myjob.py
```python
df = spark.sql("select * from range(10)")
df.show()
```

### serverless-job2.json:
```
{
  "name": "myjob",
  "email_notifications": {
    "no_alert_for_skipped_runs": false
  },
  "webhook_notifications": {},
  "timeout_seconds": 0,
  "max_concurrent_runs": 1,
  "tasks": [
    {
      "task_key": "stubby",
      "run_if": "ALL_SUCCESS",
      "spark_python_task": {
        "python_file": "/Users/douglas.moore@databricks.com/jobs/myjob-file2.py"
      },
      "timeout_seconds": 0,
      "email_notifications": {},
      "notification_settings": {
        "no_alert_for_skipped_runs": false,
        "no_alert_for_canceled_runs": false,
        "alert_on_last_attempt": false
      },
      "webhook_notifications": {},
      "environment_key": "default"
    }
  ],
  "queue": {
    "enabled": true
  },
  "environments": [
    {
      "environment_key": "default",
      "spec": {
        "client": "1"
      }
    }
  ],
  "run_as": {
    "user_name": "douglas.moore@databricks.com"
  }
}
```
