#!/usr/bin/env bash

THREADS=100
SUBS_FILE=""
URLS_FILE=""

while getopts ":fqs:t:u:" opt; do
  case $opt in
    f)
        FULLSCAN=true
        ;;
    q)
        QUICKSCAN=true
        ;;
    s)
        SUBS_FILE=$OPTARG
        ;;
    t)
        THREADS=$OPTARG
        ;;
    u)
        URLS_FILE=$OPTARG
        ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    :)
        echo "Option -$OPTARG requires an argument." >&2
        exit 1
        ;;
  esac
done

if [ "$FULLSCAN" = true ]; then
  FULLSCAN(){
    for target in $(cat $SUBS_FILE);do printf "\033[0;32mStarting on $target\033[0m\n"; echo $target | python3 main.py -t $THREADS | grep -E "\\.zip$|\\.rar$|\\.tar$|\\.tar.gz$|\\.tgz$|\\.sql$|\\.sqlite$|\\.pgsql.txt$|\\.mysql.txt$|\\.gz$|\\.config$|\\.log$|\\.bak$|\\.backup$|\\.bkp$|\\.crt$|\\.dat$|\\.eml$|\\.java$|\\.lst$|\\.key$|\\.passwd$|\\.pl$|\\.pwd$|\\.mysql-connect$|\\.jar$|\\.cfg$|\\.dir$|\\.orig$|\\.bz2$|\\.old$|\\.vbs$|\\.img$|\\.inf$|\\.sh$|\\.py$|\\.vbproj$|\\.mysql-pconnect$|\\.war$|\\.go$|\\.psql$|\\.sql.gz$|\\.vb$|\\.webinfo$|\\.jnlp$|\\.cgi$|\\.temp$|\\.ini$|\\.webproj$|\\.xsql$|\\.raw$|\\.inc$|\\.lck$|\\.nz$|\\.rc$|\\.html.gz$|\\.env$|\\.yml$|\\.save$|\\.xls$|\\.xlsx$|\\.json$|\\.pdf$|\\.doc$|\\.docx$|\\.pptx$|\\.csv$|\\.properties$|\\.pem$|\\.xml$|\\.ts$|\\.htaccess$|\\.txt$|\\.mdb$|\\.7z$|\\.dll$" >> sensitive-urls.txt;done
  }
  FULLSCAN
fi

if [ "$QUICKSCAN" = true ]; then
  QUICKSCAN(){
    cat $URLS_FILE | grep "\\.zip$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-zip.txt
	cat $URLS_FILE | grep "\\.rar$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-rar.txt
	cat $URLS_FILE | grep "\\.tar$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-tar.txt
	cat $URLS_FILE | grep "\\.tar.gz$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-tar.gz.txt
	cat $URLS_FILE | grep "\\.tgz$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-sql.txt
	cat $URLS_FILE | grep "\\.sql$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-sql.txt
	cat $URLS_FILE | grep "\\.sqlite$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-sqlite.txt
	cat $URLS_FILE | grep "\\.pgsql.txt$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-pgsql.txt.txt
	cat $URLS_FILE | grep "\\.mysql.txt$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-mysql.txt.txt
	cat $URLS_FILE | grep "\\.gz$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-gz.txt
	cat $URLS_FILE | grep "\\.config$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-config.txt
	cat $URLS_FILE | grep "\\.log$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-log.txt
	cat $URLS_FILE | grep "\\.bak$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-bak.txt
	cat $URLS_FILE | grep "\\.backup$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-backup.txt
	cat $URLS_FILE | grep "\\.bkp$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-bkp.txt
	cat $URLS_FILE | grep "\\.crt$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-crt.txt
	cat $URLS_FILE | grep "\\.dat$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-dat.txt
	cat $URLS_FILE | grep "\\.eml$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-eml.txt
	cat $URLS_FILE | grep "\\.java$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-java.txt
	cat $URLS_FILE | grep "\\.lst$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-lst.txt
	cat $URLS_FILE | grep "\\.key$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-key.txt
	cat $URLS_FILE | grep "\\.passwd$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-passwd.txt
	cat $URLS_FILE | grep "\\.pl$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-pl.txt
	cat $URLS_FILE | grep "\\.pwd$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-pwd.txt
	cat $URLS_FILE | grep "\\.mysql-connect$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-mysql-connect.txt
	cat $URLS_FILE | grep "\\.jar$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-jar.txt
	cat $URLS_FILE | grep "\\.cfg$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-cfg.txt
	cat $URLS_FILE | grep "\\.dir$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-dir.txt
	cat $URLS_FILE | grep "\\.orig$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-orig.txt
	cat $URLS_FILE | grep "\\.bz2$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-bz2.txt
	cat $URLS_FILE | grep "\\.old$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-old.txt
	cat $URLS_FILE | grep "\\.vbs$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-vbs.txt
	cat $URLS_FILE | grep "\\.img$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-img.txt
	cat $URLS_FILE | grep "\\.inf$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-inf.txt
	cat $URLS_FILE | grep "\\.sh$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-sh.txt
	cat $URLS_FILE | grep "\\.py$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-py.txt
	cat $URLS_FILE | grep "\\.vbproj$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-vbproj.txt
	cat $URLS_FILE | grep "\\.mysql-pconnect$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-mysql-pconnect.txt
	cat $URLS_FILE | grep "\\.war$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-war.txt
	cat $URLS_FILE | grep "\\.go$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-go.txt
	cat $URLS_FILE | grep "\\.psql$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-psql.txt
	cat $URLS_FILE | grep "\\.sql.gz$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-sql.gz.txt
	cat $URLS_FILE | grep "\\.vb$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-vb.txt
	cat $URLS_FILE | grep "\\.webinfo$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-webinfo.txt
	cat $URLS_FILE | grep "\\.jnlp$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-jnlp.txt
	cat $URLS_FILE | grep "\\.cgi$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-cgi.txt
	cat $URLS_FILE | grep "\\.temp$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-temp.txt
	cat $URLS_FILE | grep "\\.ini$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-ini.txt
	cat $URLS_FILE | grep "\\.webproj$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-webproj.txt
	cat $URLS_FILE | grep "\\.xsql$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-xsql.txt
	cat $URLS_FILE | grep "\\.raw$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-raw.txt
	cat $URLS_FILE | grep "\\.inc$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-inc.txt
	cat $URLS_FILE | grep "\\.lck$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-lck.txt
	cat $URLS_FILE | grep "\\.nz$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-nz.txt
	cat $URLS_FILE | grep "\\.rc$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-rc.txt
	cat $URLS_FILE | grep "\\.html.gz$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-html.gz.txt
	cat $URLS_FILE | grep "\\.env$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-env.txt
	cat $URLS_FILE | grep "\\.yml$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-yml.txt
	cat $URLS_FILE | grep "\\.save$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-save.txt
	cat $URLS_FILE | grep "\\.xls$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-xls.txt
	cat $URLS_FILE | grep "\\.xlsx$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-xlsx.txt
	cat $URLS_FILE | grep "\\.json$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-json.txt
	cat $URLS_FILE | grep "\\.pdf$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-pdf.txt
	cat $URLS_FILE | grep "\\.doc$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-doc.txt
	cat $URLS_FILE | grep "\\.docx$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-docx.txt
	cat $URLS_FILE | grep "\\.pptx$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-pptx.txt
	cat $URLS_FILE | grep "\\.csv$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-csv.txt
	cat $URLS_FILE | grep "\\.properties$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-properties.txt
	cat $URLS_FILE | grep "\\.pem$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-pem.txt
	cat $URLS_FILE | grep "\\.xml$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-xml.txt
	cat $URLS_FILE | grep "\\.ts$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-ts.txt
	cat $URLS_FILE | grep "\\.htaccess$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-htaccess.txt
	cat $URLS_FILE | grep "\\.txt$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-txt.txt
	cat $URLS_FILE | grep "\\.mdb$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-mdb.txt
	cat $URLS_FILE | grep "\\.7z$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-7z.txt
	cat $URLS_FILE | grep "\\.dll$" | httpx -mc 200 -t $THREADS -silent | anew sensitive-dll.txt
  }
  QUICKSCAN
fi