import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import List exposing (..)

main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

inputDay1 =
  "-4 ,+9 ,+6 ,+8 ,+3 ,+14 ,+11 ,+7 ,-12 ,+4 ,-15 ,+2 ,-12 ,-4 ,+15 ,-8 ,-16 ,-4 ,+14 ,-11 ,-19 ,-2 ,+15 ,-4 ,-5 ,-1 ,+15 ,-8 ,+1 ,+10 ,+7 ,+18 ,+1 ,+10 ,+11 ,+17 ,-16 ,+4 ,-12 ,+14 ,+9 ,+6 ,+7 ,+10 ,+14 ,+7 ,+6 ,-3 ,+19 ,+18 ,+4 ,+16 ,+17 ,+11 ,+9 ,+7 ,-8 ,-1 ,-5 ,-12 ,-7 ,+4 ,-5 ,+2 ,+4 ,+3 ,+20 ,-19 ,+18 ,+12 ,+14 ,+5 ,-14 ,+7 ,-19 ,-20 ,+6 ,-3 ,+7 ,+15 ,+12 ,+11 ,+15 ,+2 ,+3 ,-17 ,-18 ,+1 ,+13 ,-3 ,+14 ,-1 ,-8 ,-9 ,-12 ,+15 ,-8 ,+10 ,+11 ,+15 ,+4 ,+6 ,+16 ,+1 ,+3 ,+13 ,-6 ,+14 ,-3 ,-12 ,-12 ,+14 ,+6 ,-10 ,+20 ,+5 ,+18 ,+11 ,+3 ,+17 ,+2 ,-9 ,-17 ,-14 ,+2 ,+9 ,+11 ,-2 ,+14 ,+5 ,-7 ,+18 ,-6 ,-9 ,-9 ,-10 ,-12 ,-16 ,-1 ,+14 ,-15 ,-9 ,-2 ,-6 ,-11 ,-14 ,-11 ,-19 ,+11 ,-12 ,-18 ,-5 ,+11 ,+18 ,+17 ,-5 ,-19 ,+14 ,+11 ,-2 ,-14 ,+17 ,+8 ,+3 ,+12 ,-9 ,+1 ,+23 ,+7 ,-12 ,+24 ,+10 ,-2 ,+6 ,+20 ,-16 ,-17 ,+19 ,-7 ,+11 ,+14 ,+21 ,-18 ,+1 ,+4 ,+8 ,-2 ,-5 ,-12 ,-13 ,+7 ,+19 ,+2 ,+8 ,+9 ,+8 ,+2 ,+17 ,+15 ,+18 ,+18 ,+18 ,-2 ,-13 ,-18 ,-12 ,-1 ,+17 ,-14 ,-15 ,+8 ,+20 ,+9 ,-7 ,+11 ,-15 ,-16 ,-11 ,-9 ,+11 ,+19 ,+15 ,+4 ,+15 ,+9 ,-3 ,+5 ,-18 ,+6 ,+17 ,+15 ,-8 ,-13 ,+16 ,+8 ,+17 ,+2 ,+18 ,+2 ,+2 ,+4 ,-10 ,+11 ,-3 ,+8 ,+2 ,+3 ,-12 ,+6 ,+12 ,-1 ,+21 ,-13 ,-17 ,-10 ,+13 ,-6 ,-18 ,-4 ,-6 ,-5 ,+18 ,-20 ,-6 ,-7 ,-17 ,-6 ,-18 ,+9 ,+16 ,+14 ,+10 ,+16 ,+1 ,-4 ,+1 ,+15 ,-9 ,-5 ,-4 ,-7 ,-7 ,-1 ,+13 ,-15 ,-1 ,-22 ,-19 ,+10 ,-8 ,-5 ,+16 ,-12 ,+17 ,+7 ,+4 ,-7 ,+4 ,+6 ,+5 ,-2 ,-1 ,+20 ,-8 ,-3 ,+7 ,-47 ,-10 ,+19 ,-27 ,-3 ,+13 ,-26 ,+1 ,+8 ,-30 ,-14 ,+3 ,+17 ,-16 ,-2 ,-11 ,+14 ,-8 ,-7 ,-10 ,-8 ,+20 ,+23 ,+26 ,+12 ,-25 ,-88 ,+4 ,+1 ,-29 ,-5 ,+16 ,-19 ,+15 ,+19 ,-27 ,-8 ,-18 ,-9 ,-12 ,-10 ,+14 ,-13 ,-14 ,-10 ,-21 ,-14 ,+6 ,-1 ,+21 ,+14 ,+6 ,+21 ,-2 ,+17 ,+20 ,-5 ,+17 ,-4 ,-14 ,-9 ,-11 ,-14 ,+17 ,+20 ,+10 ,+20 ,-80 ,+15 ,-27 ,-42 ,+7 ,-18 ,+14 ,-4 ,-16 ,-3 ,+10 ,-8 ,-25 ,-14 ,-3 ,+24 ,+3 ,+18 ,-35 ,+54 ,+29 ,-35 ,+63 ,+4 ,-119 ,-24 ,-57508 ,+1 ,-10 ,-10 ,-17 ,-8 ,-9 ,+4 ,-7 ,+19 ,+2 ,+19 ,+8 ,-16 ,-19 ,-2 ,+5 ,+2 ,+10 ,+11 ,-6 ,-18 ,+11 ,-17 ,-17 ,+12 ,+4 ,-2 ,-17 ,-5 ,+7 ,-18 ,-14 ,-3 ,-18 ,-16 ,+18 ,-1 ,-10 ,-8 ,-13 ,+12 ,-4 ,-9 ,+6 ,+11 ,-5 ,+9 ,+13 ,+16 ,+15 ,-5 ,+10 ,+13 ,-19 ,-16 ,-13 ,+5 ,-12 ,+8 ,+1 ,+14 ,+23 ,-1 ,+17 ,-15 ,-19 ,-9 ,+8 ,-2 ,+19 ,-13 ,-15 ,+2 ,+12 ,-15 ,-16 ,-20 ,-2 ,+14 ,+6 ,-1 ,-1 ,-3 ,-9 ,-3 ,-15 ,+6 ,+4 ,-8 ,+9 ,-14 ,-10 ,+9 ,-15 ,-16 ,-3 ,-18 ,-9 ,+18 ,-8 ,-16 ,-18 ,+14 ,+17 ,+9 ,+12 ,-7 ,+2 ,+15 ,+12 ,-7 ,-11 ,+13 ,+8 ,+5 ,+2 ,+10 ,-19 ,-12 ,-20 ,+10 ,+7 ,+19 ,-8 ,-7 ,+19 ,-18 ,-15 ,-9 ,-12 ,-18 ,+2 ,+12 ,+10 ,-5 ,+7 ,-15 ,+1 ,-11 ,-18 ,-8 ,-16 ,-16 ,+13 ,-19 ,-10 ,-5 ,-5 ,-18 ,+13 ,+3 ,+16 ,+17 ,+15 ,+19 ,-11 ,+15 ,-12 ,+2 ,+17 ,+17 ,-16 ,-15 ,+5 ,+20 ,-12 ,+5 ,+2 ,+7 ,+15 ,-6 ,-17 ,+18 ,-20 ,-8 ,-15 ,-18 ,-1 ,-20 ,-5 ,+18 ,-11 ,-15 ,+2 ,-15 ,-15 ,+8 ,-18 ,+1 ,+1 ,+5 ,+5 ,+11 ,+5 ,+15 ,+16 ,+19 ,-4 ,-7 ,-5 ,+8 ,-2 ,-19 ,+7 ,-6 ,+19 ,+17 ,+9 ,+2 ,+1 ,-15 ,-2 ,-6 ,-12 ,+19 ,-16 ,-9 ,+4 ,-3 ,+21 ,+6 ,+27 ,+14 ,-22 ,+18 ,+12 ,+18 ,+13 ,-10 ,+8 ,-13 ,-6 ,+10 ,-12 ,-17 ,-38 ,+21 ,-19 ,+18 ,-23 ,-7 ,+17 ,+8 ,+59 ,+3 ,-19 ,+22 ,+17 ,+15 ,+5 ,+24 ,+13 ,+15 ,+8 ,+18 ,-17 ,+16 ,+16 ,+20 ,+1 ,+7 ,-16 ,-15 ,+2 ,-18 ,-9 ,+1 ,+13 ,+5 ,-17 ,+22 ,-13 ,-21 ,-12 ,-4 ,+20 ,-31 ,-12 ,-34 ,+10 ,+2 ,+20 ,+22 ,-28 ,-19 ,-19 ,-2 ,+133 ,+17 ,-10 ,+18 ,-10 ,+6 ,+20 ,-10 ,+3 ,+11 ,+14 ,-5 ,+3 ,+20 ,+11 ,-9 ,-12 ,-1 ,-3 ,-19 ,+12 ,+14 ,+8 ,+12 ,+2 ,+18 ,+7 ,-19 ,+11 ,-22 ,+13 ,-9 ,+15 ,-13 ,+1 ,+20 ,+14 ,-9 ,+11 ,-18 ,+13 ,-21 ,-20 ,-16 ,+7 ,-14 ,+12 ,-1 ,+8 ,-16 ,-16 ,-13 ,+7 ,-3 ,+19 ,-22 ,-10 ,+6 ,+1 ,+16 ,+4 ,-1 ,-12 ,-16 ,-10 ,+29 ,+8 ,+18 ,-9 ,+11 ,+18 ,-6 ,-2 ,+4 ,-3 ,-8 ,-9 ,+21 ,+13 ,-23 ,-26 ,-22 ,-9 ,-24 ,-11 ,+2 ,-18 ,-42 ,+13 ,+46 ,-96 ,-7 ,-9 ,-131 ,-6 ,-21 ,+11 ,-18 ,+14 ,+28 ,-18 ,-11 ,-18 ,-48 ,+7 ,+69 ,+9 ,-24 ,-15 ,+46 ,-10 ,+137 ,-57522 ,+5 ,+4 ,+3 ,+16 ,-3 ,-18 ,+3 ,-9 ,-10 ,+11 ,+12 ,-8 ,-18 ,-18 ,-4 ,+18 ,+19 ,-4 ,-19 ,-19 ,+4 ,-15 ,+3 ,-16 ,-2 ,+12 ,+16 ,+9 ,+10 ,+13 ,+1 ,+21 ,+17 ,+18 ,+5 ,-4 ,-2 ,+15 ,+13 ,+2 ,+7 ,-19 ,+1 ,-16 ,-7 ,-10 ,+18 ,+12 ,-21 ,-7 ,+3 ,+16 ,+14 ,-13 ,+17 ,+2 ,+7 ,-2 ,-10 ,-17 ,+9 ,-5 ,+14 ,+13 ,+7 ,+15 ,-13 ,+1 ,-13 ,+16 ,-2 ,-5 ,-7 ,+15 ,+13 ,-8 ,-1 ,+18 ,+16 ,-15 ,-7 ,+11 ,+10 ,+16 ,-12 ,+15 ,-16 ,-14 ,+8 ,-16 ,-4 ,-4 ,-19 ,-17 ,-4 ,+18 ,+1 ,+14 ,-9 ,-15 ,+19 ,+8 ,+19 ,+14 ,+20 ,-14 ,+1 ,-18 ,+4 ,-3 ,+2 ,-20 ,+10 ,-2 ,+1 ,-3 ,-2 ,-3 ,+12 ,+6 ,+6 ,+11 ,+17 ,-7 ,+20 ,-16 ,+5 ,+6 ,-39 ,-26 ,-31 ,-29 ,+2 ,-19 ,+18 ,-6 ,-16 ,+14 ,+4 ,-19 ,+18 ,-14 ,-1 ,-10 ,-4 ,-17 ,+6 ,+17 ,+1 ,+1 ,-12 ,+21 ,-12 ,+16 ,-12 ,+16 ,-27 ,+22 ,-2 ,+30 ,+1 ,-3 ,+7 ,+23 ,-9 ,+20 ,+34 ,-142 ,-7 ,+5 ,+16 ,-23 ,-9 ,+7 ,-2 ,+12 ,-15 ,-4 ,-19 ,-16 ,+15 ,+13 ,+4 ,+4 ,-16 ,-7 ,+10 ,+17 ,-6 ,-15 ,+11 ,-5 ,-8 ,-18 ,+115524"

inputDay2 = "bazvmqthjtrnlosiecxyghkwud,pazvmqbijirzlosiecxyghkwud,pazvtqbmjtrnlosiecxyghkwzd,pazvmqbfjtrjlosnlcxyghkwud,pazvkqbfjtrtlosiecjyghkwud,paztmqbfjtrnbosiecxyglkwud,pazvmqbfjtunlosievxmghkwud,pazvmqbfjtmngosiecyyghkwud,jazvmqbfjtrnlosiecxygikpud,pazvqqbfctrnlosimcxyghkwud,pazvmqbfjtrnwogiecxyihkwud,pazvmqbfjtrqlojiecxeghkwud,payvmqbfjtrzlosiecxyghkwuk,pkzvmqnfjtrnlosieciyghkwud,pazvmqqfjtrnldsiecxyghkwui,pazvmqbfttrqlosiecxywhkwud,gazvmybfjthnlosiecxyghkwud,pazvmqbfjtrnlasiecxygptwud,pktvmqbfjtrnwosiecxyghkwud,pazvmqwfjtrnlosiecxgghkkud,pazvmzkbjtrnlosiecxyghkwud,pazvmqbfjtrnloslecxyghuwui,pezvmqbfjtrnlesieyxyghkwud,cazvmqbfjrrnlosiecxyghkmud,pazvmqrfjjrnlosiecxyghkwnd,pazvmqbgjtrnlosiecxyphtwud,pazvmqbvmtrnlosiecxyghkpud,pazdmqbfjtrnlosiecxyuhkpud,pazvmqbflnrnloshecxyghkwud,pazvvqbfjprilosiecxyghkwud,pazvwqbfjtrllosiecxyghknud,pazvmqbfjtrnloniecxdghkaud,pazvmqbfjtrnlvsuecxynhkwud,ptzvmqwfjtrnlosieccyghkwud,pkzvmqbjjtrnlosiecryghkwud,pazvmqqfjtrexosiecxyghkwud,pazgmqbfjtrneoyiecxyghkwud,paznmqbfjtrnlosiecxydhkwzd,pazvmqbfjtrnaosiwcxsghkwud,pazomqbfjxrnlosiewxyghkwud,pazsmqbfjprnlosiecxrghkwud,pazvmqbfqtrnoosiecxygmkwud,aazvmqbfjtrnlosiacxyghjwud,pazviqbfjtrnlobiecxygrkwud,qazwmqbfjhrnlosiecxyghkwud,pazvmqbfftrnlosiqcxygfkwud,patvmqbfjtonlosircxyghkwud,pazvmqbfjtrnlomaecxyghkpud,paztmqbfjtrulossecxyghkwud,pazvmqbijtrnlobiecxyghkwkd,pazvsqbfjtrnlospecxyghkqud,pbzmmqbfjtrnlosiecxyghkwhd,pezvkqbfjtenlosiecxyghkwud,razvmqbfjkrnlosiecxeghkwud,pazcmqbfjtrnloriecxyghkgud,pazvmqbfftfnlosiecvyghkwud,pazvmqpujtrnlosiepxyghkwud,patvgqbfjtrnloslecxyghkwud,pazvmqbfltrnlosibcxyghswud,pazvmebfjtrnlosaecxyehkwud,pazdmqbejtrnlosiecxyghrwud,pazvmcbfntrplosiecxyghkwud,pszvmqbfjtrnlosivcfyghkwud,puzvmqbfjtrnloeiecxyxhkwud,pazvmqbfjtrivooiecxyghkwud,pazvyqbfjtrngosiwcxyghkwud,pauvmqbfjtrnlosimexyghkwud,pazvmqbfjtrnwoshecxeghkwud,dazvmqbfjtrnloshecxygxkwud,pazvmqbfjtrtdosiecxyghvwud,pazxmqbfjtrnlosieceyghjwud,pazvmqbfjtrnlosihexjghkwud,pazvmqbfjsrnlosiecxughiwud,phzvcqbfjtrqlosiecxyghkwud,pazvmibfjtrnlosjecxxghkwud,pazvmqbfjtrbeosiecxlghkwud,pazvmqyfjttolosiecxyghkwud,fawvmqbfjtrnlosiecxyghkwhd,pazvmqbfjprnxosiecxyghkbud,macvmqbfjtrnlosiesxyghkwud,pazsmqbfjtrflouiecxyghkwud,pacvmqbfjtrnltsiecxyghcwud,pazvmqbfjtymlosiecxygykwud,pazvmqbfjtrclosiecxygukwmd,pazvmqbfjtrnlobiecxphhkwud,mazvmqbhitrnlosiecxyghkwud,pazvmqdtjtrnlrsiecxyghkwud,pazvmqbfjgrnllsieczyghkwud,pazvmqbfjtrilosiecxxgikwud,pazvmqbjjtrnlosreceyghkwud,paxvmmbfjtrilosiecxyghkwud,pazqmwbfjtrnlowiecxyghkwud,pazvmqbfjfrnqosiecxyghkwui,pazvmqbfjtrrgosiecxyghswud,pazvmqnfjtrnlosiecsyghkwmd,paiemqbmjtrnlosiecxyghkwud,pazvmqbfdtqnlosiecxyjhkwud,pazvmxbfjthndosiecxyghkwud,pqzvmqbfjtrnlosiecxbghkzud,pagrmqbfjtrnlosiecxygskwud,pazamqtfjtrnsosiecxyghkwud,pazvmqbfjtrnldshecxyzhkwud,pazvmnbfjtrllosieclyghkwud,snzvmqbfjnrnlosiecxyghkwud,pazvsqbfjdrnlosiecxyghswud,pazvmqnfjfrnlosiecsyghkwud,pazvmqbfjtrnlosiecxjghowum,pazvmqbfjtjnlosieczygfkwud,pazvmqbsjtrnloziecxyghkeud,pazvxqbgjtrnlooiecxyghkwud,pazvmqbfjtrnlooiecxmyhkwud,pazvmqbyftrnlosgecxyghkwud,pazvmqbfjtrnlosiwcxyqhksud,pazvmqkyjtrnlokiecxyghkwud,pazfmqbfjtrnlosijcxyohkwud,pazvmqbfjtrnlociecxygikcud,fazvmqbfjtrnlosiecxyjhkuud,pazvmqbojtknlohiecxyghkwud,pazvmqbfjtgnlosbecxyghkwux,pazvmqbfjtrnlocieckoghkwud,pazvdqbfjtrlltsiecxyghkwud,pazvmqbfjtsnlfsiecxyglkwud,przvpqbfjtrnyosiecxyghkwud,pazvmbrfjtrnlosiecxmghkwud,dazvmqbfttrnlostecxyghkwud,pazvmqbfttdnlosiecxygwkwud,pazvmqbvitrnlosieexyghkwud,pazvmqbfjhrnlosjecxyvhkwud,pazvmqbfstrnlosiecxyggkwpd,bazvmqbfjtrnlmsiecxyohkwud,patmmqbfjtrnlosizcxyghkwud,pazvmqbfwtrglosieqxyghkwud,pazvmqbfjtrnlosiecxdhhkwmd,pazvmqbfjdrnlosnexxyghkwud,oazrrqbfjtrnlosiecxyghkwud,pazvmqbfjcrnlosiecxygakwjd,pazvmqbfjtrnlosifcxfghkwyd,pazvmnbfjtrnlosiecxyahzwud,pazvmqbfgtrnlojiecxyghkgud,pazvmqbfjtrnlaliecxyghkwuy,pazvmqbfjtrnlfsiecrtghkwud,pazvmqbkjtrnloswecxdghkwud,pazvtqbfjtdnlosiecxyghkwuu,pozvmqbfrtrnlosiesxyghkwud,payvmqbfjornlossecxyghkwud,pazvuqbfjtrnlosiscxyghkpud,pgzcmqbfjtrnlotiecxyghkwud,pazvvqbfjtrnlobieyxyghkwud,pazycqbfjtrnlosiecxyzhkwud,pizvdqbfjtrnlosiecxbghkwud,pazvmqbfjtrnloqiecxmgtkwud,gazvmqbfjtrnlusiecxpghkwud,pazvmqdfjtralosiecxyghkwmd,pazvmqbfjtmnlosiecxywhawud,pazvlqbfjtrnlosqecxyghqwud,pazvmqbfjtrnlhsneixyghkwud,kazvmqbfjtrqlosimcxyghkwud,pazvmwbfjtrclosiecxyghkuud,pazvmqjfjtrnlosieckyghpwud,pezvmqbgjtrnloseecxyghkwud,pazvqqbfjtfnlosvecxyghkwud,oazvmqbfjtunlosiecxyghkwad,pazvmqbfjtrncoswecxyghfwud,pazvyqbfjtrnlosqecxygtkwud,pazvmqbfjtrvlzsiecxygwkwud,pazvmqbfjjrnlosiekxylhkwud,madvmqbfjtrnlosircxyghkwud,pazvmybfjtrnlisiecxyghkwbd,pazvmqbjjixnlosiecxyghkwud,pazvmqefjtrnloqiecxyghhwud,pazveqbfjtrnlosiecgygzkwud,pazvmqbfjtrxlosiecxmgwkwud,uazvmqufjtrnlosiecxyghkwuo,pasymqbfjtrnlosiecxyghowud,pazvmqbfjtlnlpsiecxyghswud,pnzvmqbfjprnloszecxyghkwud,pafjmqcfjtrnlosiecxyghkwud,pazvmqxfbtrnloqiecxyghkwud,pazvmzbfjtrnposiccxyghkwud,pazvmqbfjotulosiecxyghkwud,pazvmqbfotrnlosgecxykhkwud,przvmqbfjtrnlosiecxyqhkwcd,pazvmqbfjtsnlogiecxyyhkwud,pazvmqbfrtrnlzsiecxyghkwug,pazvmqbfjtrnlosiecxzgukwuo,pqzvmqbqjtrnlosdecxyghkwud,pazvmqbfjtqqlosiecxughkwud,pazvmqbfjtrnlosiedhyphkwud,pazsmqbcutrnlosiecxyghkwud,pazvmqbgrtrnlosiecxyghpwud,pazemqbfjtznlosiecxyghkvud,pazvkqbfjtrilosiecxyghkwod,pfzvmqbfjtrnlopiecxygjkwud,pazvmqvfjtreloniecxyghkwud,pazvmqbfjernljsiecxgghkwud,pazvmqikjtrnlosiecxyghqwud,pazvmqbfjtrnpesoecxyghkwud,fazvmqbfjtrnlosihchyghkwud,pazvmqbfjtgnloanecxyghkwud,pazvmqsfjqrnlosiecxychkwud,parvmqbfjtrnlosiecxygfuwud,przvmqbfjtrhlosihcxyghkwud,pazvmqbcjtrnlosimcxgghkwud,pazvmqbfjtrnlosceciyjhkwud,pazvkqbfjtrylosivcxyghkwud,pazvmqbfjtrnlgsieoxyghdwud,pazvmqnfstrnlowiecxyghkwud,pazvmqbfdtrnlosieumyghkwud,pazvmqbfjtrnlosyecxfghkwul,pazvmqbfjtrclosivcxyghkcud,pazjmqbfjtrnlosiecxygokwkd,hazvmqbfjtrflosiecxzghkwud,wazvmqbfjtrnlomiecxyphkwud,yazvmqbfjirnkosiecxyghkwud,pczvmqbfjtrnlohiecxyghkwpd,pazvmqbfotrbeosiecxlghkwud,pazvmqbfjtrplosiecxynhzwud,paxvbqbwjtrnlosiecxyghkwud,pazvmqvfjtrnlosiecbyghqwud,pazjmqbfjtrnlosiecxoghkwed,pazvmqbfjtreljsitcxyghkwud,mazamqbfjtrnlosiecxoghkwud,pazvmqbfjjrnposiscxyghkwud,pbrvmqbfjtrnloliecxyghkwud,pazvmqbfjtrnlosiecxgghkyyd,pmzvmqbfntrnlosiecxyghkwuw,pazvzqbfjtrnlosienxyghzwud,pazvmqifjtvnlosrecxyghkwud,tazvmqbhjtjnlosiecxyghkwud,pazvmqbfjtlnxosiecxyghkwuo,pazvmqbfjennlosiecxyghkwxd,pahvmqbfjhrnlosiecxythkwud,pazvmlkfjtrnlxsiecxyghkwud,pfzvmqbojtrnlosieciyghkwud,pazvbqbfjtrollsiecxyghkwud,eazvmqbfjtrnlosiecayghkoud,pazvmqbfjtjnlvsiecxyghkwsd,pazvoqbojtrnlosiecfyghkwud,pazvmqbfjtuslosiecxyghksud,pazvmqbfjnrnlosiedxyghkwup,pazvmqbjjtrnlosieaxyghdwud,pazccqbfjtrhlosiecxyghkwud,pbzvmqkfjtrnlosievxyghkwud,pazvmqrljtrnlosiscxyghkwud,pazvmqbfjfoqlosiecxyghkwud,pazcmqbfjtrnlosiecxyihkwuf,pszvmqbfjtrnnosiacxyghkwud,aazvmqbfjtrnlosieyxyghkwld,pazvrqbfntrnlosiycxyghkwud,pkzvoqbfjtrnlosiecxyghxwud"

type alias Model = String

init : Model
init =
  "NOTHING"

-- UPDATE

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      String.split "," inputDay2 |> findCorrectIdsCommonLetters |> Tuple.second |> Maybe.withDefault ""
      -- findCommonLetters ( String.toList "qwerty" ) "qweyty" |> Tuple.second
      --calcFrequency <| convertInputToFrequences inputDay1
    Decrement ->
      model


-- VIEW

view : Model -> Html Msg
view model =
  div [ ]
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text model ]
    , button [ onClick Increment ] [ text "+" ]
    ]

-- HELPERS

-- findFirstDuplicate : List Int -> Int
-- findFirstDuplicate frequences =


-- checkDuplicate : Int -> Set Int -> List Int -> Bool
-- checkDuplicate currentFrequency frequencesSeen changes =
--   case Set.member frequencesSeen currentFrequency of
--     True ->
--       True
--     False ->
--       case List.head changes of
--         Just head ->
--           True
--         Nothing ->
--           False


convertInputToFrequences : String -> List Int
convertInputToFrequences input =
  String.split "," input |> map (String.trim >> String.toInt >> Maybe.withDefault 0)

calcFrequency : List Int -> Int
calcFrequency changes =
  foldl (+) 0 changes

-- DAY2
compareLetter : Char -> (String, String) -> (String, String)
compareLetter letter (stringToCompare, commonLetters) =
  case String.uncons stringToCompare of
    Nothing ->
      (stringToCompare, commonLetters)
    Just (head, tail) ->
      case head == letter of
        False ->
          (tail, commonLetters)
        True ->
          (tail, commonLetters ++ ( String.fromChar letter ))

findCommonLetters : List Char -> String -> (String, String)
findCommonLetters leftString rightString =
  foldl compareLetter ( rightString, "" ) leftString


-- type alias LetterComparisonStep =
--   { stringToCompare : String
--   , commonLetters : Maybe String
--   }

-- compareIds : String -> LetterComparisonStep -> LetterComparisonStep
-- compareIds leftId step =
--   case step.commonLetters of
--     Just str ->
--       step
--     Nothing ->
--       { step |
--         commonLetters =
--           findCommonLetters ( String.toList leftId ) step.stringToCompare |> Tuple.second |> filterIfShort ( String.length leftId - 1)
--       }

-- filterIfShort : Int -> String -> Maybe String
-- filterIfShort minLength str =
--   if String.length str < minLength then
--       Nothing
--   else
--       Just str


-- type alias IdComparisonStep =
--   { idsToCompare : Maybe (List String)
--   , commonLetters : Maybe String
--   }

-- compareIdLettersToRest : String -> IdComparisonStep -> IdComparisonStep
-- compareIdLettersToRest idToCompare step =
--   case step.commonLetters of
--     Just _ ->
--       step
--     Nothing ->
--       case step.idsToCompare of
--         Just ids ->
--           { idsToCompare = List.tail ids
--           , commonLetters =
--               foldl compareIds { stringToCompare = idToCompare, commonLetters = Nothing } ids |> .commonLetters
--           }
--         Nothing ->
--           step

-- findCorrectIdsCommonLetters : List String -> IdComparisonStep
-- findCorrectIdsCommonLetters ids =
--   foldl compareIdLettersToRest { idsToCompare = List.tail ids, commonLetters = Nothing } ids


type alias LetterComparisonStep =
  { stringToCompare : String
  , commonLetters : Maybe String
  }

compareIds : String -> (String,  Maybe String) -> (String,  Maybe String)
compareIds leftId ( stringToCompare, commonLetters ) =
  case commonLetters of
    Just str ->
      ( stringToCompare, commonLetters )
    Nothing ->
      (stringToCompare,
      findCommonLetters ( String.toList leftId ) stringToCompare |> Tuple.second |> filterIfShort ( String.length leftId - 1) )
 

filterIfShort : Int -> String -> Maybe String
filterIfShort minLength str =
  if String.length str < minLength then
      Nothing
  else
      Just str


compareIdLettersToRest : String -> (Maybe (List String), Maybe String) -> (Maybe (List String), Maybe String)
compareIdLettersToRest idToCompare ( idsToCompare, commonLetters )  =
  case commonLetters of
    Just _ ->
      ( idsToCompare, commonLetters )
    Nothing ->
      case idsToCompare of
        Just ids ->
          (List.tail ids,
              foldl compareIds ( idToCompare,  Nothing ) ids |> Tuple.second
          )
        Nothing ->
          ( idsToCompare, commonLetters )

findCorrectIdsCommonLetters : List String -> (Maybe (List String), Maybe String)
findCorrectIdsCommonLetters ids =
  foldl compareIdLettersToRest ( List.tail ids, Nothing ) ids
