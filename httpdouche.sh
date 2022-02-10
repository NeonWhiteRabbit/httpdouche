#!/bin/bash 
#A quick little bashscript by n3on @n3onhacks
#./httpdouche URLLIST.txt OUTPUTFILE.txt

#Some sexy ascii text

echo ""
echo ""
echo "                 --------------------------------------------------------------"
echo "                | cleaning list of subs for only http 200/300 status responses |"
echo "                |               prior to running through scanner               |"
echo "                 ---------------------------------------------------------------"
echo ""                                                                                                                        
echo ""
echo "                                      .-:://+++++//:-."
echo "                                 .:+shdmmmmmmmmmmmNNNNmmds+:."
echo "                               -+ydmmdys+/-..........-::/oydmNmho-"
echo "                             :hNNds:.                        -/hmNds-"
echo "                           -hNNh/                               ./hNNy:"
echo "                          +NMm/                                    -yNNy."
echo "                         oNMd.                                       -hMNo"
echo "                        sMMh       .-::::::::-.....         .......... +NMd-"
echo "                       /MMd       sMMNNNNNNMMMMMMMMMNh      NMMMNNNNNNNNMMMN:"
echo "                      -NMd        mN:       --.  .oMN      NN:     -- -hMmMN/"
echo "                      dMN.       /Mo       oNNd   sMd       Nd     oNNd yM/oMN/"
echo "                     oMM/        /Mh       :yho  :NM:       +My-    :/+dNs  yMN-"
echo "                     NMd          sNmo:-     .-/hNN+         /hmmdhhdmdy:   .mMy"
echo "                    +MM/           .+yhdmmmmmmmdho.            .:///:-       oMN."
echo "                    hMm                ..-:::-.                ....-----.    .NM/"
echo "                    NMh            .-:////++oosssssyhhhhhhdddmddmmmNmddho     mMo"
echo "                    NMh         /oyhhdddhyyysssooooooo+++/////:::-oMy.        mMo"
echo "                    NMm                                            dN:        mMo"
echo "                    hMM:                                           yMo       :NM+       .."
echo "                    :NMm.                                         .NM/      /NMh       +Nm"
echo "                     +NMm:                                 .yy-   hMy     :hMNo        hMN."
echo "                      :NMNs                                 sMMs  hMs    :dMNs.        hMm"
echo "                        sNMNo                              hMMy.dm/   +mMNo         hdosdy"
echo "                         .sNMNs-                         +dNmMdh+  /yNNd+           sm  /M."
echo "                            +hNNdo:                     dMh.-NMo/ymNms-         :+yho./hd/"
echo "                              .oMMNmds/:-.             +Mh.omMMNNMh:       -/ohhs++oyyo-"
echo "                              -dMN+oydmNNmmmmdhhhhdddhyyhymNmhsoMM/   -:oyhysooyyyo/."
echo "                             -mMm-    .-:+sdNMMNmdysoshddy+-.  :MM/:oyhyso+shhyo:."
echo "                            :mMm-     .:+yhhdyo++shddy+-       /MNys+/+shhy+-."
echo "                           :NMm-   ohddyo//+sddds/-          +Mm./ydds:"
echo "                          -NMm-    ./:--+ydmmy/-              sMNdh+-"
echo "                         .dMN-      /ydNmho:                  hMh-"
echo "                         sMM/      /mho:                      dM/"
echo "                        :NMy                                   mM:"
echo "                        mMN.                                  NN"
echo "                       oMMo         httpDOUCHE v.2.2         -MN"
echo "                      .NMm                                    /MN"
echo "                      yMM/               by n3on              +MN"
echo "                     -NMm                                    +MN"
echo "                     oMM+              @n3onhacks            +MN" 
echo "                     :hs                                     -y+"
echo ""                                                                                                                     
echo ""
echo "" 
echo "" 
echo "          Cleaned domains/subs with 200s and 300s status codes will be in $2 when completed." 
echo "" 
echo "       Wait patiently, this can take a few minutes depending on how many domains/subs you have." 
echo "" 
echo "" 

#inputs                                                                                                                                                                                 
a=$1  #listToClean
b=$2  #savedFile

#variables
pwd > directory.txt
douche=$(cat directory.txt)

cat $1 | parallel -j1000 -q curl -w 'Status:%{http_code}\t Size:%{size_download}\t %{url_effective}\n' -o /dev/null -sk > combo1.txt

#begin seperating by response
echo "---------------------=== :: ..... WORKING ON HTTP NOW ...... :: ===---------------------"
cat ${douche}/combo1.txt | grep 200 | cut -d ":" -f 4 | cut -d "/" -f 3 > 200_OK.txt
cat ${douche}/combo1.txt | grep 202 | cut -d ":" -f 4 | cut -d "/" -f 3 > 202_Accepted.txt
cat ${douche}/combo1.txt | grep 203 | cut -d ":" -f 4 | cut -d "/" -f 3 > 203_Non_Auth_Info.txt
cat ${douche}/combo1.txt | grep 204 | cut -d ":" -f 4 | cut -d "/" -f 3 > 204_No_Content.txt
cat ${douche}/combo1.txt | grep 205 | cut -d ":" -f 4 | cut -d "/" -f 3 > 205_Reset_Content.txt
cat ${douche}/combo1.txt | grep 206 | cut -d ":" -f 4 | cut -d "/" -f 3 > 206_Partial_Content.txt
cat ${douche}/combo1.txt | grep 207 | cut -d ":" -f 4 | cut -d "/" -f 3 > 207_Multi_Status.txt
cat ${douche}/combo1.txt | grep 208 | cut -d ":" -f 4 | cut -d "/" -f 3 > 208_Already_Reported.txt
cat ${douche}/combo1.txt | grep 226 | cut -d ":" -f 4 | cut -d "/" -f 3 > 226_IM_Used.txt
cat ${douche}/combo1.txt | grep 300 | cut -d ":" -f 4 | cut -d "/" -f 3 > 300_Multiple_Choice.txt
cat ${douche}/combo1.txt | grep 301 | cut -d ":" -f 4 | cut -d "/" -f 3 > 301_Moved_Perm.txt
cat ${douche}/combo1.txt | grep 302 | cut -d ":" -f 4 | cut -d "/" -f 3 > 302_Found.txt
cat ${douche}/combo1.txt | grep 303 | cut -d ":" -f 4 | cut -d "/" -f 3 > 303_See_Other.txt
cat ${douche}/combo1.txt | grep 304 | cut -d ":" -f 4 | cut -d "/" -f 3 > 304_Not_Modified.txt
cat ${douche}/combo1.txt | grep 305 | cut -d ":" -f 4 | cut -d "/" -f 3 > 305_Use_Proxy.txt
cat ${douche}/combo1.txt | grep 306 | cut -d ":" -f 4 | cut -d "/" -f 3 > 306_Unused.txt
cat ${douche}/combo1.txt | grep 307 | cut -d ":" -f 4 | cut -d "/" -f 3 > 307_Temp_Redirect.txt
cat ${douche}/combo1.txt | grep 308 | cut -d ":" -f 4 | cut -d "/" -f 3 > 308_Perm_Redirect.txt

#make directory to put seperated responses in
mkdir $2_HTTP

#clean files by making temp file, clean into folder, show findings
cat 200_OK.txt | grep -v "200" > ${douche}/almostDone.txt
cat ${douche}/almostDone.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-200.txt
cat ${douche}/$2_HTTP/HTTP-200.txt >> http-$2

cat 202_Accepted.txt | grep -v "202" > ${douche}/almostDone1.txt
cat ${douche}/almostDone1.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-202.txt
cat ${douche}/$2_HTTP/HTTP-202.txt >> http-$2

cat 203_Non_Auth_Info.txt | grep -v "203" > ${douche}/almostDone2.txt
cat ${douche}/almostDone2.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-203.txt
cat ${douche}/$2_HTTP/HTTP-203.txt >> http-$2

cat 204_No_Content.txt | grep -v "204" > ${douche}/almostDone3.txt
cat ${douche}/almostDone3.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-204.txt
cat ${douche}/$2_HTTP/HTTP-204.txt >> http-$2

cat 205_Reset_Content.txt | grep -v "205" > ${douche}/almostDone4.txt
cat ${douche}/almostDone4.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-205.txt
cat ${douche}/$2_HTTP/HTTP-205.txt >> http-$2

cat 206_Partial_Content.txt | grep -v "206" > ${douche}/almostDone5.txt
cat ${douche}/almostDone5.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-206.txt
cat ${douche}/$2_HTTP/HTTP-206.txt >> http-$2

cat 207_Multi_Status.txt | grep -v "207" > ${douche}/almostDone6.txt
cat ${douche}/almostDone6.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-207.txt
cat ${douche}/$2_HTTP/HTTP-207.txt >> http-$2

cat 208_Already_Reported.txt | grep -v "208" > ${douche}/almostDone7.txt
cat ${douche}/almostDone7.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-208.txt
cat ${douche}/$2_HTTP/HTTP-208.txt >> http-$2

cat 226_IM_Used.txt | grep -v "226" > ${douche}/almostDone8.txt
cat ${douche}/almostDone8.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-226.txt
cat ${douche}/$2_HTTP/HTTP-226.txt >> http-$2

cat 300_Multiple_Choice.txt | grep -v "300" > ${douche}/almostDone9.txt
cat ${douche}/almostDone9.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-300.txt
cat ${douche}/$2_HTTP/HTTP-300.txt >> http-$2

cat 301_Moved_Perm.txt | grep -v "301" > ${douche}/almostDone10.txt
cat ${douche}/almostDone10.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-301.txt
cat ${douche}/$2_HTTP/HTTP-301.txt >> http-$2

cat 302_Found.txt | grep -v "302" > ${douche}/almostDone11.txt
cat ${douche}/almostDone11.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-302.txt
cat ${douche}/$2_HTTP/HTTP-302.txt >> http-$2

cat 303_See_Other.txt | grep -v "303" > ${douche}/almostDone12.txt
cat ${douche}/almostDone12.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-303.txt
cat ${douche}/$2_HTTP/HTTP-303.txt >> http-$2

cat 304_Not_Modified.txt | grep -v "304" > ${douche}/almostDone13.txt
cat ${douche}/almostDone13.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-304.txt
cat ${douche}/$2_HTTP/HTTP-304.txt >> http-$2

cat 305_Use_Proxy.txt | grep -v "305" > ${douche}/almostDone14.txt
cat ${douche}/almostDone14.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-305.txt
cat ${douche}/$2_HTTP/HTTP-305.txt >> http-$2

cat 306_Unused.txt | grep -v "306" > ${douche}/almostDone15.txt
cat ${douche}/almostDone15.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-306.txt
cat ${douche}/$2_HTTP/HTTP-306.txt >> http-$2

cat 307_Temp_Redirect.txt | grep -v "307" > ${douche}/almostDone16.txt
cat ${douche}/almostDone16.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-307.txt
cat ${douche}/$2_HTTP/HTTP-307.txt >> http-$2

cat 308_Perm_Redirect.txt | grep -v "308" > ${douche}/almostDone17.txt
cat ${douche}/almostDone17.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-308.txt
cat ${douche}/$2_HTTP/HTTP-308.txt >> http-$2


cat ${douche}/almostDone.txt | grep -v -e "--" > ${douche}/$2_HTTP/HTTP-200.txt
cat ${douche}/$2_HTTP/HTTP-200.txt >> http-$2


#delete sizeless files

find ${douche}/$2_HTTP/ -size 0 -delete

echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  ||| ~~~ HTTP RESPONSES ~~~ |||  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"

#Results from findings http
FILE=${douche}/$2_HTTP/HTTP-200.txt
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 200 OK  :: ===--------------------------------"
cat ${douche}/$2_HTTP/HTTP-200.txt
fi
 
FILE=${douche}/$2_HTTP/HTTP-202.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 202 ACCEPTED  :: ===--------------------------"
cat ${c}/$2_HTTP/HTTP-202.txt
fi
 
FILE=${douche}/$2_HTTP/HTTP-203.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 203 NON-AUTHORITATIVE INFO  :: ===------------"
cat ${c}/$2_HTTP/HTTP-203.txt
fi

FILE=${douche}/$2_HTTP/HTTP-204.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 204 NO CONTENT  :: ===------------------------"
cat ${douche}/$2_HTTP/HTTP-204.txt
fi

FILE=${douche}/$2_HTTP/HTTP-205.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 205 RESET CONTENT  :: ===---------------------"
cat ${douche}/$2_HTTP/HTTP-205.txt
fi

FILE=${douche}/$2_HTTP/HTTP-206.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 206 PARTIAL CONTENT  :: ===-------------------"
cat ${douche}/$2_HTTP/HTTP-206.txt
fi

FILE=${douche}/$2_HTTP/HTTP-207.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 207 MULTI-STATUS -webDAV-  :: ===-------------"
cat ${douche}/$2_HTTP/HTTP-207.txt
fi

FILE=${douche}/$2_HTTP/HTTP-208.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 208 NO ALREADY REPORTER -webDAV-  :: ===------"
cat ${douche}/$2_HTTP/HTTP-208.txt
fi

FILE=${douche}/$2_HTTP/HTTP-226.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 226 IM USED -HTTP DELTA ENCODING-  :: ===-----"
cat ${douche}/$2_HTTP/HTTP-226.txt
fi

FILE=${douche}/$2_HTTP/HTTP-300.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 300 MULTIPLE CHOICE  :: ===-------------------"
cat ${douche}/$2_HTTP/HTTP-300.txt
fi

FILE=${douche}/$2_HTTP/HTTP-301.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 301 MOVED PERMANENTLY  :: ===-----------------"
cat ${douche}/$2_HTTP/HTTP-301.txt
fi

FILE=${douche}/$2_HTTP/HTTP-302.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 302 FOUND  :: ===-----------------------------"
cat ${douche}/$2_HTTP/HTTP-302.txt
fi

FILE=${douche}/$2_HTTP/HTTP-303.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 303 SEE OTHER  :: ===-------------------------"
cat ${douche}/$2_HTTP/HTTP-303.txt
fi

FILE=${douche}/$2_HTTP/HTTP-304.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 304 NOT MODIFIED  :: ===----------------------"
cat ${douche}/$2_HTTP/HTTP-304.txt
fi

FILE=${douche}/$2_HTTP/HTTP-305.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 305 USE PROXY  :: ===-------------------------"
cat ${douche}/$2_HTTP/HTTP-305.txt
fi

FILE=${douche}/$2_HTTP/HTTP-307.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 307 TEMP REDIRECT  :: ===---------------------"
cat ${douche}/$2_HTTP/HTTP-307.txt
fi

FILE=${douche}/$2_HTTP/HTTP-308.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 308 PERM REDIRECT  :: ===---------------------"
cat ${douche}/$2_HTTP/HTTP-308.txt
fi

echo "---------------------=== :: ..... WORKING ON HTTPS NOW ..... :: ===---------------------"

#https

awk '{print "https://"$0}' $1 > https.txt


cat https.txt | parallel -j1000 -q curl -w 'Status:%{http_code}\t Size:%{size_download}\t %{url_effective}\n' -o /dev/null -sk > combo2.txt

#begin seperating by response

cat ${douche}/combo2.txt | grep 200 | cut -d ":" -f 4 | cut -d "/" -f 3 > 200_OK2.txt
cat ${douche}/combo2.txt | grep 202 | cut -d ":" -f 4 | cut -d "/" -f 3 > 202_Accepted2.txt
cat ${douche}/combo2.txt | grep 203 | cut -d ":" -f 4 | cut -d "/" -f 3 > 203_Non_Auth_Info2.txt
cat ${douche}/combo2.txt | grep 204 | cut -d ":" -f 4 | cut -d "/" -f 3 > 204_No_Content2.txt
cat ${douche}/combo2.txt | grep 205 | cut -d ":" -f 4 | cut -d "/" -f 3 > 205_Reset_Content2.txt
cat ${douche}/combo2.txt | grep 206 | cut -d ":" -f 4 | cut -d "/" -f 3 > 206_Partial_Content2.txt
cat ${douche}/combo2.txt | grep 207 | cut -d ":" -f 4 | cut -d "/" -f 3 > 207_Multi_Status2.txt
cat ${douche}/combo2.txt | grep 208 | cut -d ":" -f 4 | cut -d "/" -f 3 > 208_Already_Reported2.txt
cat ${douche}/combo2.txt | grep 226 | cut -d ":" -f 4 | cut -d "/" -f 3 > 226_IM_Used2.txt
cat ${douche}/combo2.txt | grep 300 | cut -d ":" -f 4 | cut -d "/" -f 3 > 300_Multiple_Choice2.txt
cat ${douche}/combo2.txt | grep 301 | cut -d ":" -f 4 | cut -d "/" -f 3 > 301_Moved_Perm2.txt
cat ${douche}/combo2.txt | grep 302 | cut -d ":" -f 4 | cut -d "/" -f 3 > 302_Found2.txt
cat ${douche}/combo2.txt | grep 303 | cut -d ":" -f 4 | cut -d "/" -f 3 > 303_See_Other2.txt
cat ${douche}/combo2.txt | grep 304 | cut -d ":" -f 4 | cut -d "/" -f 3 > 304_Not_Modified2.txt
cat ${douche}/combo2.txt | grep 305 | cut -d ":" -f 4 | cut -d "/" -f 3 > 305_Use_Proxy2.txt
cat ${douche}/combo2.txt | grep 306 | cut -d ":" -f 4 | cut -d "/" -f 3 > 306_Unused2.txt
cat ${douche}/combo2.txt | grep 307 | cut -d ":" -f 4 | cut -d "/" -f 3 > 307_Temp_Redirect2.txt
cat ${douche}/combo2.txt | grep 308 | cut -d ":" -f 4 | cut -d "/" -f 3 > 308_Perm_Redirect2.txt

#make directory to put seperated responses in
mkdir $2_HTTPS

#clean files by making temp file, clean into folder, show findings
cat 200_OK2.txt | grep -v "200" > ${douche}/almostDone2x.txt
cat ${douche}/almostDone2x.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-200.txt
cat ${douche}/$2_HTTPS/HTTPS-200.txt >> https-$2

cat 202_Accepted2.txt | grep -v "202" > ${douche}/almostDone12x.txt
cat ${douche}/almostDone12x.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-202.txt
cat ${douche}/$2_HTTPS/HTTPS-202.txt >> https-$2

cat 203_Non_Auth_Info2.txt | grep -v "203" > ${douche}/almostDone22.txt
cat ${douche}/almostDone22.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-203.txt
cat ${douche}/$2_HTTPS/HTTPS-203.txt >> https-$2

cat 204_No_Content2.txt | grep -v "204" > ${douche}/almostDone32.txt
cat ${douche}/almostDone32.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-204.txt
cat ${douche}/$2_HTTPS/HTTPS-204.txt >> https-$2

cat 205_Reset_Content2.txt | grep -v "205" > ${douche}/almostDone42.txt
cat ${douche}/almostDone42.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-205.txt
cat ${douche}/$2_HTTPS/HTTPS-205.txt >> https-$2

cat 206_Partial_Content2.txt | grep -v "206" > ${douche}/almostDone52.txt
cat ${douche}/almostDone52.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-206.txt
cat ${douche}/$2_HTTPS/HTTPS-206.txt >> https-$2

cat 207_Multi_Status2.txt | grep -v "207" > ${douche}/almostDone62.txt
cat ${douche}/almostDone62.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-207.txt
cat ${douche}/$2_HTTPS/HTTPS-207.txt >> https-$2

cat 208_Already_Reported2.txt | grep -v "208" > ${douche}/almostDone72.txt
cat ${douche}/almostDone72.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-208.txt
cat ${douche}/$2_HTTPS/HTTPS-208.txt >> https-$2

cat 226_IM_Used2.txt | grep -v "226" > ${douche}/almostDone82.txt
cat ${douche}/almostDone82.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-226.txt
cat ${douche}/$2_HTTPS/HTTPS-226.txt >> https-$2

cat 300_Multiple_Choice2.txt | grep -v "300" > ${douche}/almostDone92.txt
cat ${douche}/almostDone92.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-300.txt
cat ${douche}/$2_HTTPS/HTTPS-300.txt >> https-$2

cat 301_Moved_Perm2.txt | grep -v "301" > ${douche}/almostDone102.txt
cat ${douche}/almostDone102.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-301.txt
cat ${douche}/$2_HTTPS/HTTPS-301.txt >> https-$2

cat 302_Found2.txt | grep -v "302" > ${douche}/almostDone112.txt
cat ${douche}/almostDone112.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-302.txt
cat ${douche}/$2_HTTPS/HTTPS-302.txt >> https-$2

cat 303_See_Other2.txt | grep -v "303" > ${douche}/almostDone122.txt
cat ${douche}/almostDone122.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-303.txt
cat ${douche}/$2_HTTPS/HTTPS-303.txt >> https-$2

cat 304_Not_Modified2.txt | grep -v "304" > ${douche}/almostDone132.txt
cat ${douche}/almostDone132.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-304.txt
cat ${douche}/$2_HTTPS/HTTPS-304.txt >> https-$2

cat 305_Use_Proxy2.txt | grep -v "305" > ${douche}/almostDone142.txt
cat ${douche}/almostDone142.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-305.txt
cat ${douche}/$2_HTTPS/HTTPS-305.txt >> https-$2

cat 306_Unused2.txt | grep -v "306" > ${douche}/almostDone152.txt
cat ${douche}/almostDone152.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-306.txt
cat ${douche}/$2_HTTPS/HTTPS-306.txt >> https-$2

cat 307_Temp_Redirect2.txt | grep -v "307" > ${douche}/almostDone162.txt
cat ${douche}/almostDone162.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-307.txt
cat ${douche}/$2_HTTPS/HTTPS-307.txt >> https-$2

cat 308_Perm_Redirect2.txt | grep -v "308" > ${douche}/almostDone172.txt
cat ${douche}/almostDone172.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-308.txt
cat ${douche}/$2_HTTPS/HTTPS-308.txt >> https-$2


cat ${douche}/almostDone2x.txt | grep -v -e "--" > ${douche}/$2_HTTPS/HTTPS-200.txt
cat ${douche}/$2_HTTPS/HTTPS-200.txt >> https-$2


#delete sizeless files

find ${douche}/$2_HTTPS/ -size 0 -delete

echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  ||| ~~~ HTTPS RESPONSES ~~~ |||  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"

#Results from findings https
FILE=${douche}/$2_HTTPS/HTTPS-200.txt
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 200 OK  :: ===--------------------------------"
cat ${douche}/$2_HTTPS/HTTPS-200.txt
fi
 
FILE=${douche}/$2_HTTPS/HTTPS-202.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 202 ACCEPTED  :: ===--------------------------"
cat ${douche}/$2_HTTPS/HTTPS-202.txt
fi
 
FILE=${douche}/$2_HTTPS/HTTPS-203.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 203 NON-AUTHORITATIVE INFO  :: ===------------"
cat ${douche}/$2_HTTPS/HTTPS-203.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-204.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 204 NO CONTENT  :: ===------------------------"
cat ${douche}/$2_HTTPS/HTTPS-204.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-205.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 205 RESET CONTENT  :: ===---------------------"
cat ${douche}/$2_HTTPS/HTTPS-205.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-206.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 206 PARTIAL CONTENT  :: ===-------------------"
cat ${douche}/$2_HTTPS/HTTPS-206.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-207.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 207 MULTI-STATUS -webDAV-  :: ===-------------"
cat ${douche}/$2_HTTPS/HTTPS-207.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-208.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 208 NO ALREADY REPORTER -webDAV-  :: ===------"
cat ${douche}/$2_HTTPS/HTTPS-208.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-226.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 226 IM USED -HTTP DELTA ENCODING-  :: ===-----"
cat ${douche}/$2_HTTPS/HTTPS-226.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-300.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 300 MULTIPLE CHOICE  :: ===-------------------"
cat ${douche}/$2_HTTPS/HTTPS-300.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-301.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 301 MOVED PERMANENTLY  :: ===-----------------"
cat ${douche}/$2_HTTPS/HTTPS-301.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-302.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 302 FOUND  :: ===-----------------------------"
cat ${douche}/$2_HTTPS/HTTPS-302.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-303.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 303 SEE OTHER  :: ===-------------------------"
cat ${douche}/$2_HTTPS/HTTPS-303.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-304.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 304 NOT MODIFIED  :: ===----------------------"
cat ${douche}/$2_HTTPS/HTTPS-304.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-305.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 305 USE PROXY  :: ===-------------------------"
cat ${douche}/$2_HTTPS/HTTPS-305.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-307.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 307 TEMP REDIRECT  :: ===---------------------"
cat ${douche}/$2_HTTPS/HTTPS-307.txt
fi

FILE=${douche}/$2_HTTPS/HTTPS-308.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 308 PERM REDIRECT  :: ===---------------------"
cat ${douche}/$2_HTTPS/HTTPS-308.txt
fi

#Completed banner begin
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::             COMPLETED            :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== :: Files Seperated By Responses Are :: ===---------------------"
echo "---------------------=== ::           Available At:          :: ===---------------------"
echo "----------=== ::- ${douche}/$2_HTTP/ -:: ===-------------"
echo "----------=== ::- ${douche}/$2_HTTPS/ -:: ===-------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::          Folder Contents:        :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"

#Show folder contents
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --  File for subm3rge Tool: --  :: ===---------------------"
echo "---------------------=== ::  --- ${douche}/subtxt/ ---  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"

mv http-$2 http-$1
mv https-$2 https-$1
 
cp http-$1 ${douche}/subtxt/
cp https-$1 ${douche}/subtxt/

#remove temp files
rm ${douche}/https.txt
rm ${douche}/directory.txt
rm ${douche}/combo1.txt
rm ${douche}/200_OK.txt
rm ${douche}/202_Accepted.txt
rm ${douche}/203_Non_Auth_Info.txt
rm ${douche}/204_No_Content.txt
rm ${douche}/205_Reset_Content.txt
rm ${douche}/206_Partial_Content.txt
rm ${douche}/207_Multi_Status.txt
rm ${douche}/208_Already_Reported.txt
rm ${douche}/226_IM_Used.txt
rm ${douche}/300_Multiple_Choice.txt
rm ${douche}/301_Moved_Perm.txt
rm ${douche}/302_Found.txt
rm ${douche}/303_See_Other.txt
rm ${douche}/304_Not_Modified.txt
rm ${douche}/305_Use_Proxy.txt
rm ${douche}/306_Unused.txt
rm ${douche}/307_Temp_Redirect.txt
rm ${douche}/308_Perm_Redirect.txt
rm ${douche}/almostDone.txt
rm ${douche}/almostDone1.txt
rm ${douche}/almostDone2.txt
rm ${douche}/almostDone2x.txt
rm ${douche}/almostDone3.txt
rm ${douche}/almostDone4.txt
rm ${douche}/almostDone5.txt
rm ${douche}/almostDone6.txt
rm ${douche}/almostDone7.txt
rm ${douche}/almostDone8.txt
rm ${douche}/almostDone9.txt
rm ${douche}/almostDone10.txt
rm ${douche}/almostDone11.txt
rm ${douche}/almostDone12.txt
rm ${douche}/almostDone12x.txt
rm ${douche}/almostDone13.txt
rm ${douche}/almostDone14.txt
rm ${douche}/almostDone15.txt
rm ${douche}/almostDone16.txt
rm ${douche}/almostDone17.txt
rm ${douche}/combo2.txt
rm ${douche}/200_OK2.txt
rm ${douche}/202_Accepted2.txt
rm ${douche}/203_Non_Auth_Info2.txt
rm ${douche}/204_No_Content2.txt
rm ${douche}/205_Reset_Content2.txt
rm ${douche}/206_Partial_Content2.txt
rm ${douche}/207_Multi_Status2.txt
rm ${douche}/208_Already_Reported2.txt
rm ${douche}/226_IM_Used2.txt
rm ${douche}/300_Multiple_Choice2.txt
rm ${douche}/301_Moved_Perm2.txt
rm ${douche}/302_Found2.txt
rm ${douche}/303_See_Other2.txt
rm ${douche}/304_Not_Modified2.txt
rm ${douche}/305_Use_Proxy2.txt
rm ${douche}/306_Unused2.txt
rm ${douche}/307_Temp_Redirect2.txt
rm ${douche}/308_Perm_Redirect2.txt
rm ${douche}/almostDone22.txt
rm ${douche}/almostDone32.txt
rm ${douche}/almostDone42.txt
rm ${douche}/almostDone52.txt
rm ${douche}/almostDone62.txt
rm ${douche}/almostDone72.txt
rm ${douche}/almostDone82.txt
rm ${douche}/almostDone92.txt
rm ${douche}/almostDone102.txt
rm ${douche}/almostDone112.txt
rm ${douche}/almostDone122.txt
rm ${douche}/almostDone132.txt
rm ${douche}/almostDone142.txt
rm ${douche}/almostDone152.txt
rm ${douche}/almostDone162.txt
rm ${douche}/almostDone172.txt
