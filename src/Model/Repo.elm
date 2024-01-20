module Model.Repo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Json.Decode as De


type alias Repo =
    { name : String
    , description : Maybe String
    , url : String
    , pushedAt : String
    , stars : Int
    }


view : Repo -> Html msg
view repo =
    div [class "repo"]
        [ h1 [class "repo-name"] [text repo.name]
        , case repo.description of
            Just desc ->
                p [class "repo-description"] [text desc]

            Nothing ->
                text ""

        , p [class "repo-url"] [a [class "repo-link", href repo.url] [text repo.name]]
        , p [class "repo-stars"] [text <| String.fromInt repo.stars]
        ]


sortByStars : List Repo -> List Repo
sortByStars repos =
    List.sortBy .stars repos


{-| Deserializes a JSON object to a `Repo`.
Field mapping (JSON -> Elm):

  - name -> name
  - description -> description
  - html\_url -> url
  - pushed\_at -> pushedAt
  - stargazers\_count -> stars

-}
decodeRepo : De.Decoder Repo
decodeRepo =
   De.map5 Repo
    (De.field "name" De.string)
    (De.maybe (De.field "description" De.string))
    (De.field "html_url" De.string)
    (De.field "pushed_at" De.string)
    (De.field "stargazers_count" De.int)