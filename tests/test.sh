#!/usr/bin/env bash

# Be strict
set -e
set -u
set -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


###
### Find exactly 4 unique URLs
###
"${DIR}/../linkcheck" -r 10 -t 30 "${DIR}/urls_valid_4.txt"
echo

if [ "$( "${DIR}/../linkcheck" -r 10 -t 30 "${DIR}/urls_valid_4.txt" | grep -c "[OK]" )" -eq "4" ]; then
	echo "[OK]"
	echo
else
	>&2 echo "FAILED: Not exactly 4 succeeded URLs found."
	exit 1
fi


###
### Find exactly 4 redirecting URLs and fail
###
"${DIR}/../linkcheck" -r 10 -t 30 "${DIR}/urls_redirect_4.txt" || true
echo

if [ "$( "${DIR}/../linkcheck" -r 10 -t 30 "${DIR}/urls_redirect_4.txt" | grep -c "[ERR]" )" -eq "4" ]; then
	echo "[OK]"
	echo
else
	>&2 echo "FAILED: Not exactly 4 redirecting URLs found."
	exit 1
fi


###
### Find exactly 4 redirecting URLs and allow
###
"${DIR}/../linkcheck" -r 10 -t 30 -c '200,301,302' "${DIR}/urls_redirect_4.txt" || true
echo

if [ "$( "${DIR}/../linkcheck" -r 10 -t 30 -c '200,301,302' "${DIR}/urls_redirect_4.txt" | grep -c "[OK]" )" -eq "4" ]; then
	echo "[OK]"
	echo
else
	>&2 echo "FAILED: Not exactly 4 redirecting URLs found."
	exit 1
fi


###
### Find exactly 4 redirecting URLs and follow them
###
"${DIR}/../linkcheck" -l -r 10 -t 30 "${DIR}/urls_redirect_4.txt"
echo

if [ "$( "${DIR}/../linkcheck" -l -r 10 -t 30 "${DIR}/urls_redirect_4.txt" | grep -c "[OK]" )" -eq "4" ]; then
	echo "[OK]"
	echo
else
	>&2 echo "FAILED: Not exactly 4 redirecting and successfully followed URLs found."
	exit 1
fi
