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
echo "                       oMMo         httpDOUCHE v.2.1         -MN"
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

#add to lines --can be done with just $(cat file.txt) but we want to have fun scripting dont we.
echo "#!/bin/bash" > ${douche}/cleaned_query.sh
File="$1"
Lines=$(cat $File)
for Line in $Lines
do
echo "curl -IL $Line -o /dev/null -w '%{http_code}\n' -s" >> ${douche}/douche_query.txt
done

#make sure shits clean and no repeats, create new bin file, chmod and execute it
awk '!a[$0]++' ${douche}/douche_query.txt > ${douche}/cleaned_query.txt 
cat ${douche}/cleaned_query.txt > ${douche}/cleaned_query.sh
chmod 777 ${douche}/cleaned_query.sh
${douche}/./cleaned_query.sh > ${douche}/status_codes.txt

#grab the original url order to add status codes cleanly....or DOUCHED
cat ${douche}/cleaned_query.sh | cut -d " " -f 3 > ${douche}/combo1.txt

#begin seperating by response
echo "...working...on....the...DOUCHING..." 
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 200 > 200_OK.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 202 > 202_Accepted.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 203 > 203_Non_Auth_Info.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 204 > 204_No_Content.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 205 > 205_Reset_Content.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 206 > 206_Partial_Content.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 207 > 207_Multi_Status.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 208 > 208_Already_Reported.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 226 > 226_IM_Used.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 300 > 300_Multiple_Choice.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 301 > 301_Moved_Perm.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 302 > 302_Found.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 303 > 303_See_Other.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 304 > 304_Not_Modified.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 305 > 305_Use_Proxy.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 306 > 306_Unused.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 307 > 307_Temp_Redirect.txt
paste -d'\n' ${douche}/combo1.txt ${douche}/status_codes.txt | grep -B 1 308 > 308_Perm_Redirect.txt

#make directory to put seperated responses in
mkdir $2_folder

#clean files by making temp file, clean into folder, show findings
cat 200_OK.txt | grep -v "200" > ${douche}/almostDone.txt
cat ${douche}/almostDone.txt | grep -v -e "--" > ${douche}/$2_folder/200.txt
cat ${douche}/$2_folder/200.txt >> $2

cat 202_Accepted.txt | grep -v "202" > ${douche}/almostDone1.txt
cat ${douche}/almostDone1.txt | grep -v -e "--" > ${douche}/$2_folder/202.txt
cat ${douche}/$2_folder/202.txt >> $2

cat 203_Non_Auth_Info.txt | grep -v "203" > ${douche}/almostDone2.txt
cat ${douche}/almostDone2.txt | grep -v -e "--" > ${douche}/$2_folder/203.txt
cat ${douche}/$2_folder/203.txt >> $2

cat 204_No_Content.txt | grep -v "204" > ${douche}/almostDone3.txt
cat ${douche}/almostDone3.txt | grep -v -e "--" > ${douche}/$2_folder/204.txt
cat ${douche}/$2_folder/204.txt >> $2

cat 205_Reset_Content.txt | grep -v "205" > ${douche}/almostDone4.txt
cat ${douche}/almostDone4.txt | grep -v -e "--" > ${douche}/$2_folder/205.txt
cat ${douche}/$2_folder/205.txt >> $2

cat 206_Partial_Content.txt | grep -v "206" > ${douche}/almostDone5.txt
cat ${douche}/almostDone5.txt | grep -v -e "--" > ${douche}/$2_folder/206.txt
cat ${douche}/$2_folder/206.txt >> $2

cat 207_Multi_Status.txt | grep -v "207" > ${douche}/almostDone6.txt
cat ${douche}/almostDone6.txt | grep -v -e "--" > ${douche}/$2_folder/207.txt
cat ${douche}/$2_folder/207.txt >> $2

cat 208_Already_Reported.txt | grep -v "208" > ${douche}/almostDone7.txt
cat ${douche}/almostDone7.txt | grep -v -e "--" > ${douche}/$2_folder/208.txt
cat ${douche}/$2_folder/208.txt >> $2

cat 226_IM_Used.txt | grep -v "226" > ${douche}/almostDone8.txt
cat ${douche}/almostDone8.txt | grep -v -e "--" > ${douche}/$2_folder/226.txt
cat ${douche}/$2_folder/226.txt >> $2

cat 300_Multiple_Choice.txt | grep -v "300" > ${douche}/almostDone9.txt
cat ${douche}/almostDone9.txt | grep -v -e "--" > ${douche}/$2_folder/300.txt
cat ${douche}/$2_folder/300.txt >> $2

cat 301_Moved_Perm.txt | grep -v "301" > ${douche}/almostDone10.txt
cat ${douche}/almostDone10.txt | grep -v -e "--" > ${douche}/$2_folder/301.txt
cat ${douche}/$2_folder/301.txt >> $2

cat 302_Found.txt | grep -v "302" > ${douche}/almostDone11.txt
cat ${douche}/almostDone11.txt | grep -v -e "--" > ${douche}/$2_folder/302.txt
cat ${douche}/$2_folder/302.txt >> $2

cat 303_See_Other.txt | grep -v "303" > ${douche}/almostDone12.txt
cat ${douche}/almostDone12.txt | grep -v -e "--" > ${douche}/$2_folder/303.txt
cat ${douche}/$2_folder/303.txt >> $2

cat 304_Not_Modified.txt | grep -v "304" > ${douche}/almostDone13.txt
cat ${douche}/almostDone13.txt | grep -v -e "--" > ${douche}/$2_folder/304.txt
cat ${douche}/$2_folder/304.txt >> $2

cat 305_Use_Proxy.txt | grep -v "305" > ${douche}/almostDone14.txt
cat ${douche}/almostDone14.txt | grep -v -e "--" > ${douche}/$2_folder/305.txt
cat ${douche}/$2_folder/305.txt >> $2

cat 306_Unused.txt | grep -v "306" > ${douche}/almostDone15.txt
cat ${douche}/almostDone15.txt | grep -v -e "--" > ${douche}/$2_folder/306.txt
cat ${douche}/$2_folder/306.txt >> $2

cat 307_Temp_Redirect.txt | grep -v "307" > ${douche}/almostDone16.txt
cat ${douche}/almostDone16.txt | grep -v -e "--" > ${douche}/$2_folder/307.txt
cat ${douche}/$2_folder/307.txt >> $2

cat 308_Perm_Redirect.txt | grep -v "308" > ${douche}/almostDone17.txt
cat ${douche}/almostDone17.txt | grep -v -e "--" > ${douche}/$2_folder/308.txt
cat ${douche}/$2_folder/308.txt >> $2

#delete sizeless files

find ${douche}/$2_folder/ -size 0 -delete

#Results from findings
FILE=${douche}/$2_folder/200.txt
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 200 OK  :: ===--------------------------------"
cat ${douche}/$2_folder/200.txt
fi
 
FILE=${douche}/$2_folder/202.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 202 ACCEPTED  :: ===--------------------------"
cat ${c}/$2_folder/202.txt
fi
 
FILE=${douche}/$2_folder/203.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 203 NON-AUTHORITATIVE INFO  :: ===------------"
cat ${c}/$2_folder/203.txt
fi

FILE=${douche}/$2_folder/204.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 204 NO CONTENT  :: ===------------------------"
cat ${douche}/$2_folder/204.txt
fi

FILE=${douche}/$2_folder/205.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 205 RESET CONTENT  :: ===---------------------"
cat ${douche}/$2_folder/205.txt
fi

FILE=${douche}/$2_folder/206.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 206 PARTIAL CONTENT  :: ===-------------------"
cat ${douche}/$2_folder/206.txt
fi

FILE=${douche}/$2_folder/207.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 207 MULTI-STATUS -webDAV-  :: ===-------------"
cat ${douche}/$2_folder/207.txt
fi

FILE=${douche}/$2_folder/208.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 208 NO ALREADY REPORTER -webDAV-  :: ===------"
cat ${douche}/$2_folder/208.txt
fi

FILE=${douche}/$2_folder/226.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 226 IM USED -HTTP DELTA ENCODING-  :: ===-----"
cat ${douche}/$2_folder/226.txt
fi

FILE=${douche}/$2_folder/300.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 300 MULTIPLE CHOICE  :: ===-------------------"
cat ${douche}/$2_folder/300.txt
fi

FILE=${douche}/$2_folder/301.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 301 MOVED PERMANENTLY  :: ===-----------------"
cat ${douche}/$2_folder/301.txt
fi

FILE=${douche}/$2_folder/302.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 302 FOUND  :: ===-----------------------------"
cat ${douche}/$2_folder/302.txt
fi

FILE=${douche}/$2_folder/303.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 303 SEE OTHER  :: ===-------------------------"
cat ${douche}/$2_folder/303.txt
fi

FILE=${douche}/$2_folder/304.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 304 NOT MODIFIED  :: ===----------------------"
cat ${douche}/$2_folder/304.txt
fi

FILE=${douche}/$2_folder/305.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 305 USE PROXY  :: ===-------------------------"
cat ${douche}/$2_folder/305.txt
fi

FILE=${douche}/$2_folder/307.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 307 TEMP REDIRECT  :: ===---------------------"
cat ${douche}/$2_folder/307.txt
fi

FILE=${douche}/$2_folder/308.txt 
if [[ -f "$FILE" ]]; then
echo "---------------------=== ::  Status Code: 308 PERM REDIRECT  :: ===---------------------"
cat ${douche}/$2_folder/308.txt
fi

#Completed banner begin
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::             COMPLETED            :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== :: Files Seperated By Responses Are :: ===---------------------"
echo "---------------------=== ::           Available At:          :: ===---------------------"
echo "---------------------=== ::- ${douche}/$2_folder/ -:: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::          Folder Contents:        :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"

#Show folder contents
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"
echo "---------------------=== ::  --  File for subm3rge Tool: --  :: ===---------------------"
echo "---------------------=== ::  --- ${douche}/subtxt/ ---  :: ===---------------------"
echo "---------------------=== ::  --------========-----=========  :: ===---------------------"

cp $2 ${douche}/subtxt/

#remove temp files
rm ${douche}/directory.txt
rm ${douche}/douche_query.txt
rm ${douche}/cleaned_query.txt
rm ${douche}/status_codes.txt
rm ${douche}/combo1.txt
rm ${douche}/cleaned_query.sh
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
rm ${douche}/almostDone13.txt
rm ${douche}/almostDone14.txt
rm ${douche}/almostDone15.txt
rm ${douche}/almostDone16.txt
rm ${douche}/almostDone17.txt
