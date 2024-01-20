module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, id)
import Html.Attributes exposing (href)



type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
    div [] 
    [
        h1 [id "name"] [text details.name]
        , em [id "intro"] [text details.intro]
        , viewDetails "contact-detail" details.contacts
        , viewSocials "social-links" details.socials
    ]
    
viewDetails : String -> List DetailWithName ->Html msg
viewDetails name detialList=
    ul[]
    (List.map (\detail -> p [class name] [text (detail.name ++ ": " ++ detail.detail)]) detialList)

viewSocials : String -> List DetailWithName ->Html msg
viewSocials name socialList=
    ul[]
    (List.map (\social -> a [class name, href social.detail] [text social.name]) socialList)
