export NODE_ENV=development
export DISABLE_DB_BACKUP=true
export DISABLE_ES_SNAPSHOT=true
export SLEEP_TIME=0
export ALLOWED_REFERERS=true
export DISABLE_SECURE_COOKIES=true
export YF_ENABLED=false
export FORCE_ESCALATION_DELAY=1000
export DEV_SERVER=true
export ES_USER=elasticcd
export ES_PASS=changeme
export SOURCE_MAP=1
export DB_USER=postgres
export DB_HOST=0.0.0.0
export DB_PASS=postgres
export AUDIT_DB_PASS=postgres
export FILESTORE_DB_PASS=postgres
export QUARTZ_DB_PASS=postgres
export APP_CONFIG_PATH=/workspaces/config_unfaox00_v5
# FOR make retore tag
export DB_DATA=/workspaces/isight_main_v5_beta
# FOR v8.4+
export DISABLE_CONFIG_BACKUP=true
alias expath='export APP_CONFIG_PATH=$(pwd)'
#MAIL enivrontment variables for maildev
export MAIL_DISABLE_STARTTLS=true
export MAIL_IGNORE_TLS=true
export MAIL_HOST=0.0.0.0
export MAIL_DISABLE_DNS_VALID=1
export MAIL_TRANSPORT=smtp
