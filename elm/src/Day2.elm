import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import List exposing (..)

main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

inputDay2 = "bazvmqthjtrnlosiecxyghkwud,pazvmqbijirzlosiecxyghkwud,pazvtqbmjtrnlosiecxyghkwzd,pazvmqbfjtrjlosnlcxyghkwud,pazvkqbfjtrtlosiecjyghkwud,paztmqbfjtrnbosiecxyglkwud,pazvmqbfjtunlosievxmghkwud,pazvmqbfjtmngosiecyyghkwud,jazvmqbfjtrnlosiecxygikpud,pazvqqbfctrnlosimcxyghkwud,pazvmqbfjtrnwogiecxyihkwud,pazvmqbfjtrqlojiecxeghkwud,payvmqbfjtrzlosiecxyghkwuk,pkzvmqnfjtrnlosieciyghkwud,pazvmqqfjtrnldsiecxyghkwui,pazvmqbfttrqlosiecxywhkwud,gazvmybfjthnlosiecxyghkwud,pazvmqbfjtrnlasiecxygptwud,pktvmqbfjtrnwosiecxyghkwud,pazvmqwfjtrnlosiecxgghkkud,pazvmzkbjtrnlosiecxyghkwud,pazvmqbfjtrnloslecxyghuwui,pezvmqbfjtrnlesieyxyghkwud,cazvmqbfjrrnlosiecxyghkmud,pazvmqrfjjrnlosiecxyghkwnd,pazvmqbgjtrnlosiecxyphtwud,pazvmqbvmtrnlosiecxyghkpud,pazdmqbfjtrnlosiecxyuhkpud,pazvmqbflnrnloshecxyghkwud,pazvvqbfjprilosiecxyghkwud,pazvwqbfjtrllosiecxyghknud,pazvmqbfjtrnloniecxdghkaud,pazvmqbfjtrnlvsuecxynhkwud,ptzvmqwfjtrnlosieccyghkwud,pkzvmqbjjtrnlosiecryghkwud,pazvmqqfjtrexosiecxyghkwud,pazgmqbfjtrneoyiecxyghkwud,paznmqbfjtrnlosiecxydhkwzd,pazvmqbfjtrnaosiwcxsghkwud,pazomqbfjxrnlosiewxyghkwud,pazsmqbfjprnlosiecxrghkwud,pazvmqbfqtrnoosiecxygmkwud,aazvmqbfjtrnlosiacxyghjwud,pazviqbfjtrnlobiecxygrkwud,qazwmqbfjhrnlosiecxyghkwud,pazvmqbfftrnlosiqcxygfkwud,patvmqbfjtonlosircxyghkwud,pazvmqbfjtrnlomaecxyghkpud,paztmqbfjtrulossecxyghkwud,pazvmqbijtrnlobiecxyghkwkd,pazvsqbfjtrnlospecxyghkqud,pbzmmqbfjtrnlosiecxyghkwhd,pezvkqbfjtenlosiecxyghkwud,razvmqbfjkrnlosiecxeghkwud,pazcmqbfjtrnloriecxyghkgud,pazvmqbfftfnlosiecvyghkwud,pazvmqpujtrnlosiepxyghkwud,patvgqbfjtrnloslecxyghkwud,pazvmqbfltrnlosibcxyghswud,pazvmebfjtrnlosaecxyehkwud,pazdmqbejtrnlosiecxyghrwud,pazvmcbfntrplosiecxyghkwud,pszvmqbfjtrnlosivcfyghkwud,puzvmqbfjtrnloeiecxyxhkwud,pazvmqbfjtrivooiecxyghkwud,pazvyqbfjtrngosiwcxyghkwud,pauvmqbfjtrnlosimexyghkwud,pazvmqbfjtrnwoshecxeghkwud,dazvmqbfjtrnloshecxygxkwud,pazvmqbfjtrtdosiecxyghvwud,pazxmqbfjtrnlosieceyghjwud,pazvmqbfjtrnlosihexjghkwud,pazvmqbfjsrnlosiecxughiwud,phzvcqbfjtrqlosiecxyghkwud,pazvmibfjtrnlosjecxxghkwud,pazvmqbfjtrbeosiecxlghkwud,pazvmqyfjttolosiecxyghkwud,fawvmqbfjtrnlosiecxyghkwhd,pazvmqbfjprnxosiecxyghkbud,macvmqbfjtrnlosiesxyghkwud,pazsmqbfjtrflouiecxyghkwud,pacvmqbfjtrnltsiecxyghcwud,pazvmqbfjtymlosiecxygykwud,pazvmqbfjtrclosiecxygukwmd,pazvmqbfjtrnlobiecxphhkwud,mazvmqbhitrnlosiecxyghkwud,pazvmqdtjtrnlrsiecxyghkwud,pazvmqbfjgrnllsieczyghkwud,pazvmqbfjtrilosiecxxgikwud,pazvmqbjjtrnlosreceyghkwud,paxvmmbfjtrilosiecxyghkwud,pazqmwbfjtrnlowiecxyghkwud,pazvmqbfjfrnqosiecxyghkwui,pazvmqbfjtrrgosiecxyghswud,pazvmqnfjtrnlosiecsyghkwmd,paiemqbmjtrnlosiecxyghkwud,pazvmqbfdtqnlosiecxyjhkwud,pazvmxbfjthndosiecxyghkwud,pqzvmqbfjtrnlosiecxbghkzud,pagrmqbfjtrnlosiecxygskwud,pazamqtfjtrnsosiecxyghkwud,pazvmqbfjtrnldshecxyzhkwud,pazvmnbfjtrllosieclyghkwud,snzvmqbfjnrnlosiecxyghkwud,pazvsqbfjdrnlosiecxyghswud,pazvmqnfjfrnlosiecsyghkwud,pazvmqbfjtrnlosiecxjghowum,pazvmqbfjtjnlosieczygfkwud,pazvmqbsjtrnloziecxyghkeud,pazvxqbgjtrnlooiecxyghkwud,pazvmqbfjtrnlooiecxmyhkwud,pazvmqbyftrnlosgecxyghkwud,pazvmqbfjtrnlosiwcxyqhksud,pazvmqkyjtrnlokiecxyghkwud,pazfmqbfjtrnlosijcxyohkwud,pazvmqbfjtrnlociecxygikcud,fazvmqbfjtrnlosiecxyjhkuud,pazvmqbojtknlohiecxyghkwud,pazvmqbfjtgnlosbecxyghkwux,pazvmqbfjtrnlocieckoghkwud,pazvdqbfjtrlltsiecxyghkwud,pazvmqbfjtsnlfsiecxyglkwud,przvpqbfjtrnyosiecxyghkwud,pazvmbrfjtrnlosiecxmghkwud,dazvmqbfttrnlostecxyghkwud,pazvmqbfttdnlosiecxygwkwud,pazvmqbvitrnlosieexyghkwud,pazvmqbfjhrnlosjecxyvhkwud,pazvmqbfstrnlosiecxyggkwpd,bazvmqbfjtrnlmsiecxyohkwud,patmmqbfjtrnlosizcxyghkwud,pazvmqbfwtrglosieqxyghkwud,pazvmqbfjtrnlosiecxdhhkwmd,pazvmqbfjdrnlosnexxyghkwud,oazrrqbfjtrnlosiecxyghkwud,pazvmqbfjcrnlosiecxygakwjd,pazvmqbfjtrnlosifcxfghkwyd,pazvmnbfjtrnlosiecxyahzwud,pazvmqbfgtrnlojiecxyghkgud,pazvmqbfjtrnlaliecxyghkwuy,pazvmqbfjtrnlfsiecrtghkwud,pazvmqbkjtrnloswecxdghkwud,pazvtqbfjtdnlosiecxyghkwuu,pozvmqbfrtrnlosiesxyghkwud,payvmqbfjornlossecxyghkwud,pazvuqbfjtrnlosiscxyghkpud,pgzcmqbfjtrnlotiecxyghkwud,pazvvqbfjtrnlobieyxyghkwud,pazycqbfjtrnlosiecxyzhkwud,pizvdqbfjtrnlosiecxbghkwud,pazvmqbfjtrnloqiecxmgtkwud,gazvmqbfjtrnlusiecxpghkwud,pazvmqdfjtralosiecxyghkwmd,pazvmqbfjtmnlosiecxywhawud,pazvlqbfjtrnlosqecxyghqwud,pazvmqbfjtrnlhsneixyghkwud,kazvmqbfjtrqlosimcxyghkwud,pazvmwbfjtrclosiecxyghkuud,pazvmqjfjtrnlosieckyghpwud,pezvmqbgjtrnloseecxyghkwud,pazvqqbfjtfnlosvecxyghkwud,oazvmqbfjtunlosiecxyghkwad,pazvmqbfjtrncoswecxyghfwud,pazvyqbfjtrnlosqecxygtkwud,pazvmqbfjtrvlzsiecxygwkwud,pazvmqbfjjrnlosiekxylhkwud,madvmqbfjtrnlosircxyghkwud,pazvmybfjtrnlisiecxyghkwbd,pazvmqbjjixnlosiecxyghkwud,pazvmqefjtrnloqiecxyghhwud,pazveqbfjtrnlosiecgygzkwud,pazvmqbfjtrxlosiecxmgwkwud,uazvmqufjtrnlosiecxyghkwuo,pasymqbfjtrnlosiecxyghowud,pazvmqbfjtlnlpsiecxyghswud,pnzvmqbfjprnloszecxyghkwud,pafjmqcfjtrnlosiecxyghkwud,pazvmqxfbtrnloqiecxyghkwud,pazvmzbfjtrnposiccxyghkwud,pazvmqbfjotulosiecxyghkwud,pazvmqbfotrnlosgecxykhkwud,przvmqbfjtrnlosiecxyqhkwcd,pazvmqbfjtsnlogiecxyyhkwud,pazvmqbfrtrnlzsiecxyghkwug,pazvmqbfjtrnlosiecxzgukwuo,pqzvmqbqjtrnlosdecxyghkwud,pazvmqbfjtqqlosiecxughkwud,pazvmqbfjtrnlosiedhyphkwud,pazsmqbcutrnlosiecxyghkwud,pazvmqbgrtrnlosiecxyghpwud,pazemqbfjtznlosiecxyghkvud,pazvkqbfjtrilosiecxyghkwod,pfzvmqbfjtrnlopiecxygjkwud,pazvmqvfjtreloniecxyghkwud,pazvmqbfjernljsiecxgghkwud,pazvmqikjtrnlosiecxyghqwud,pazvmqbfjtrnpesoecxyghkwud,fazvmqbfjtrnlosihchyghkwud,pazvmqbfjtgnloanecxyghkwud,pazvmqsfjqrnlosiecxychkwud,parvmqbfjtrnlosiecxygfuwud,przvmqbfjtrhlosihcxyghkwud,pazvmqbcjtrnlosimcxgghkwud,pazvmqbfjtrnlosceciyjhkwud,pazvkqbfjtrylosivcxyghkwud,pazvmqbfjtrnlgsieoxyghdwud,pazvmqnfstrnlowiecxyghkwud,pazvmqbfdtrnlosieumyghkwud,pazvmqbfjtrnlosyecxfghkwul,pazvmqbfjtrclosivcxyghkcud,pazjmqbfjtrnlosiecxygokwkd,hazvmqbfjtrflosiecxzghkwud,wazvmqbfjtrnlomiecxyphkwud,yazvmqbfjirnkosiecxyghkwud,pczvmqbfjtrnlohiecxyghkwpd,pazvmqbfotrbeosiecxlghkwud,pazvmqbfjtrplosiecxynhzwud,paxvbqbwjtrnlosiecxyghkwud,pazvmqvfjtrnlosiecbyghqwud,pazjmqbfjtrnlosiecxoghkwed,pazvmqbfjtreljsitcxyghkwud,mazamqbfjtrnlosiecxoghkwud,pazvmqbfjjrnposiscxyghkwud,pbrvmqbfjtrnloliecxyghkwud,pazvmqbfjtrnlosiecxgghkyyd,pmzvmqbfntrnlosiecxyghkwuw,pazvzqbfjtrnlosienxyghzwud,pazvmqifjtvnlosrecxyghkwud,tazvmqbhjtjnlosiecxyghkwud,pazvmqbfjtlnxosiecxyghkwuo,pazvmqbfjennlosiecxyghkwxd,pahvmqbfjhrnlosiecxythkwud,pazvmlkfjtrnlxsiecxyghkwud,pfzvmqbojtrnlosieciyghkwud,pazvbqbfjtrollsiecxyghkwud,eazvmqbfjtrnlosiecayghkoud,pazvmqbfjtjnlvsiecxyghkwsd,pazvoqbojtrnlosiecfyghkwud,pazvmqbfjtuslosiecxyghksud,pazvmqbfjnrnlosiedxyghkwup,pazvmqbjjtrnlosieaxyghdwud,pazccqbfjtrhlosiecxyghkwud,pbzvmqkfjtrnlosievxyghkwud,pazvmqrljtrnlosiscxyghkwud,pazvmqbfjfoqlosiecxyghkwud,pazcmqbfjtrnlosiecxyihkwuf,pszvmqbfjtrnnosiacxyghkwud,aazvmqbfjtrnlosieyxyghkwld,pazvrqbfntrnlosiycxyghkwud,pkzvoqbfjtrnlosiecxyghxwud"

type alias Model =
  { part1: Int
  , part2: String
  }

init : Model
init =
  { part1 = 0
  , part2 = ""
  }

-- UPDATE

type Msg = SolvePart1 | SolvePart2

update : Msg -> Model -> Model
update msg model =
  case msg of
    SolvePart1 ->
      model
    SolvePart2 ->
      { model | part2 = String.split "," inputDay2 |> findCorrectIdsCommonLetters |> .commonLetters |> Maybe.withDefault "" }

-- VIEW

view : Model -> Html Msg
view model =
  div [ ]
    [ div [] [ text ( String.fromInt model.part1 ) ]
    , button [ onClick SolvePart1 ] [ text "Solve Part 1" ]
    , div [] [ text model.part2 ]
    , button [ onClick SolvePart2 ] [ text "Solve Part 2" ]
    ]

-- HELPERS

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


type alias LetterComparisonStep =
  { stringToCompare : String
  , commonLetters : Maybe String
  }


compareIds : String -> LetterComparisonStep -> LetterComparisonStep
compareIds leftId step =
  case step.commonLetters of
    Just str ->
      step
    Nothing ->
      { step |
        commonLetters =
          findCommonLetters ( String.toList leftId ) step.stringToCompare |> Tuple.second |> filterIfShort ( String.length leftId - 1)
      }

filterIfShort : Int -> String -> Maybe String
filterIfShort minLength str =
  if String.length str < minLength then
      Nothing
  else
      Just str


type alias IdComparisonStep =
  { idsToCompare : Maybe (List String)
  , commonLetters : Maybe String
  }

compareIdLettersToRest : String -> IdComparisonStep -> IdComparisonStep
compareIdLettersToRest idToCompare step =
  case step.commonLetters of
    Just _ ->
      step
    Nothing ->
      case step.idsToCompare of
        Just ids ->
          { idsToCompare = List.tail ids
          , commonLetters =
              foldl compareIds { stringToCompare = idToCompare, commonLetters = Nothing } ids |> .commonLetters
          }
        Nothing ->
          step

findCorrectIdsCommonLetters : List String -> IdComparisonStep
findCorrectIdsCommonLetters ids =
  foldl compareIdLettersToRest { idsToCompare = List.tail ids, commonLetters = Nothing } ids
