logparser.exe "SELECT c-ip, COUNT(*) AS c-request-count FROM UrlScan.*.log GROUP BY c-ip" -i:w3c