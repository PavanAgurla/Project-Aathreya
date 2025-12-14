#!/bin/bash
set -e

mkdir -p zap-report

# Run OWASP ZAP baseline scan
docker run --rm -v $(pwd)/zap-report:/zap/wrk owasp/zap2docker-stable \
    zap-baseline.py -t http://host.docker.internal:8080 -r /zap/wrk/report.html

if [ -f zap-report/report.html ]; then
    echo "ZAP report generated successfully"
else
    echo "ZAP report not found"
    exit 1
fi
