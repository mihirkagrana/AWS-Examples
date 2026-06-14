\# Set CloudWatch metrics to alarm state

aws cloudwatch set-alarm-state \\

&#x20;   --alarm-name "StopEC2OnHighCPU" \\

&#x20;   --state-value ALARM \\

&#x20;   --state-reason "Testing alarm actions via AWS CLI"

