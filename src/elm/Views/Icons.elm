module Views.Icons exposing (..)

import Html exposing (img, text)
import Html.Attributes exposing (alt, src)
import List
import Svg exposing (path, svg)
import Svg.Attributes as Attrs exposing (d, fill, height, version, viewBox, width)


fbIcon size color =
    svg [ version "1.1", viewBox "0 0 24 24", fill color, width size, height size ]
        [ path [ d "M5,3H19A2,2 0 0,1 21,5V19A2,2 0 0,1 19,21H5A2,2 0 0,1 3,19V5A2,2 0 0,1 5,3M18,5H15.5A3.5,3.5 0 0,0 12,8.5V11H10V14H12V21H15V14H18V11H15V9A1,1 0 0,1 16,8H18V5Z" ]
            []
        ]


phoneIcon attrs =
    img (List.append attrs [ alt "cell phone icon", src "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAB6ElEQVRoQ+1ZvU/CUBC/x8escVEn8T/AxITVxeBiYNBZHRwcNDj5keigSdWN4ODggM5CAmGBuLiSOPAn4AQ6mDpDOfMqYEFIOdpaG69T+3rv3f0+ro88BHj8Eh6vH8gAFlfiS37EtASuCbH1XMw9uUkCGUAkGqsCwFy76Gq5lJ/3GgA0Flwu5ckk2AmYnDwSjTEAVsDAAFvIc028tnfc08RW/YyAVUCoaH7czyUv5SeadJEtZDeATrUIoGq+1gIVxJ8B0AaSz6SUOEUCSwAay9sAkzOUfD9ihVqHwOOtPi7tlE1dkHZ2awDWTywV35kcfDjvrpNJKaSaSMEyi7EHGgzgi3hWgGJkttAAtthC/9dCNmxkoNYh2N7IJJG/ug9QlBs1lgGYMeXUr9FOXlaAqsDq5g5MTc/q097falBI3+j31HHXFNg4OOvBfH91qj9Tx10D0MP0aw0KdwMUGGHcNQBmlqO+5yY2Y6z/M0pt1mHxrlmI2qzD4l0DwE3c51luYm5i3omdPtjaPVJBiAkzq43zHhFestdKiDJ3nJO5HADEKEkIsc4f7sYTh6GAJiq2q4D40fRj2PHjdcmmDqLlSyJCWIjuf8YEor9DpW2EgErT10pQi5erkC00VpUOTmIADpI70tKeV+ATfDh8QIJch14AAAAASUVORK5CYII=" ]) []


flagIcon lang attrs =
    case String.toLower lang of
        "english" ->
            englishFlag attrs

        "french" ->
            frenchFlag attrs

        "german" ->
            germanFlag attrs

        "italian" ->
            italianFlag attrs

        "polish" ->
            polishFlag attrs

        "spanish" ->
            spanishFlag attrs

        _ ->
            text ""


englishFlag attrs =
    img (List.append attrs [ alt "flag image", src "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAFUUlEQVRoQ+1YbUxTVxh+OsAxChREZ3GLkcQ2AYyK21i2bIBz2Qfgjw1cq8kiK+gfv/j4MRIcjkky92OIQ5fIR9EfGy0f2w8obn8mmGUmbhNdlCUtCWRTxEREStsZhN3lPd29u7e3Ba7QzJKehB/cnvOe93nf57zneY8KIT5UIe4/wgD+7wyGMxDOwCIjEKbQIgO46OXLJwN/O52cKi5OiIjLPYOO7mGca3coilLfN7ls/ujLmZJ1a3+6zP7PebdXkT2aXGTQoSB7FWDrxFRLE1v/zKWfWfCFDIy+nsNpyioQk5sv2WBo2IlT5kFcvXFvQRsvJYAt6StxwJSGdRMOTNR+gtmx28yHmLfzkFj9sRTArZde4OjHFRlboTlcjii9XuLw+R9u4rR5EC7PzJxAlgJAbEwk9pvS8EbqE5g8eQIPLvazPSM36JBQWo4VW5+DSqWSAvir/wI3cawGnNvNJqsNRsSb9sKXVq0WO7psIwFBLBZAYf56FBn04NrMcLVbwLlcUKnViC/ZB7Vhl7CvDECrxc7tydXC2dIEd7uFTYzQJkNTWoborByJwwPXx3Ha/DuGRpwyII8KYMP6eOw3pSJ9eoRF/aHDzmxHv5oFTWk5IpLXSvaSAch+x8ZpVz+FykObkR51F5P1n2P66gBbRLRKPFItM8IOudUhoZVSAESXPQYdCnNWMcc9vT3/Bk+LxCNHGV3Eg87i8S+uwdr4mpRCBICf+Na2Z3GgOA2q7g44mxsFWsUV7wX9iQdVq+MN1/Dj5TvssxIAr2SuQeXBzVD1dLDME11oxJlKEFeyT7qPZ4Y5zu/T/21eYAC0kiJTZNSjIDsJk/V18Jy3CbSibPhGhmj1WcNvsJzZxubNVUYp0x8e3ISNK8YxebIO0wNXvJnekoHEj47KMt3ZM4KzFrsk0/MC4OETNysPbcK6ew7cr6/DzJD3XojOykZiVbXkkItDFghAq8WBojwtnOYmuK38WdMynvueNaLLqZZBv2dtwQB4p1h1MOrBfW2Gy9rGaKWKjUV8MVUHo+wwBwLw4GIfq+k8XdTvGRFf7FPtPDMs4hT5QEMGgOM44QwEXKXgh0AAFJiYc6qsCoU8AP4mXqoIBduOTAuFAQQ75D72l18GQv4QhzwAsRYS040XWzt3pEhYOHt7lF1IYhmgKa0Q+ohA9wDdrtSoiMf0lV8xUVuD2bEx9pmaKs3hMnT23ZWJRX7dgm5iJupMaYhVRwr7cVNTTKfzrR1pdXLcmbmdXfu1lV71OJcWIhFHYpE0kXhMNTfKbnkuvxANLTfwfd8tydw5AfDaPGNjkmQRyYDJ+hNCa8fLgHO9Y+jsHmZia6FqlBeLJFHEg2X2WI0g5aN0eiRUVeP6dJKkB/ELgIwW5KfgA6NOZtRfazf4ZIpMbC0UAL8BBYuy4Usrb7DqBFrxHeJZ2xi6eoZh++pNqZyu+vQXjuiifdpPWn1aO27HTub4dxduyqq/UgC8Ab4HoSDyg9HV2oYpczP7ROKRVKvz+e1IXhMjBeBbhbwH67+XAGrtqEPq6h+XaXMxikcFQDbIecoGgRGPh3a7rENc/eUZ/wAItb/W7o+VOhb1+Z5XFgOAd5o9pxSngeglHh5bDwNCUl52E1MG3NY2obWj6hJr2AXVbtO82nypMuDLR74H8aUVtZ8JZRXSDNx5fzfHd1t8a3fpzwjWh873FhQsAGSXSi1lg0qveMj6AVKjEVpva3c/9UXm+Hx0kZ1ghU29v/WBvhGt6MWEvztkAJQYe5zmLp/X6ccpqkp8CWdASbSCMTecgWBEVYnNcAaURCsYc0M+A/8AbmrJT+08CXAAAAAASUVORK5CYII=" ]) []


frenchFlag attrs =
    img (List.append attrs [ alt "flag image", src "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAq0lEQVRoQ+2Zuw2AMAxE7QkoWAeJDZCyIBtQMgGDQZFPH7uwjB41h8jd2RcnKskfTf7/wgKiFUQBFHAygIWcBLrhQ4G93K/la9e5WWADsx6LCa9PjQAWgAJYqJUQRWzqJSJ0oU4cFsJCcwyQxJ0vkpgkJomZB+b6Z3ubNkobbQywG2U3yrEK50K1CpjITHnKUP+js1GjA8JhXHBES4ACKOBkAAs5CXTD0yvwAbIIljHT/0QBAAAAAElFTkSuQmCC" ]) []


germanFlag attrs =
    img (List.append attrs [ alt "flag image", src "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAxklEQVRoQ+2ZMQrDMAxF7amnCplyic45VuZeIlPIqTolkLaGxBAw31ioPM+WZL0n0OAYnJ/o/P2BBqwNYgADIgFGSAQohycDw3Pc5GwNE8yv6Xg7DTSEfiqFASvyv7oYwIBIgBESAcrhmYGtC642cVw/SzhtYhqQh6IsAQbKeNW/jYH6TMsyYqCMV/3bf2hgefjaxP37solpoP6c32WMGGgLPKuGAWMBAQMYEAlkIyTmMwvng8MM/bcwBjAgEmCERIByuHsDO+3FbjEiHuyEAAAAAElFTkSuQmCC" ]) []


italianFlag attrs =
    img (List.append attrs [ alt "flag image", src "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAq0lEQVRoQ+2ZuxGAMAxD7QkoWIYpOMbIIOzBHNQMBkU+fezCZ+5RI45IshUnKskfTf7/wgKiFUQBFHAygIWcBLrhQ4Fyba/la+dxW2ADs+6LCa9PjQAWgAJYqJUQRWzqJSJ0oU4cFsJCcwyQxJ0vkpgkJomZB+b6Z3ubNkobbQywG2U3yrEK50K1CpjITHnKUP+js1GjA8JhXHBES4ACKOBkAAs5CXTD0yvwAYqoljEbrDv9AAAAAElFTkSuQmCC" ]) []


polishFlag attrs =
    img (List.append attrs [ alt "flag image", src "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAuUlEQVRoQ+2ZQQqAMAwE27sggm/xA77bD/gWQQTvCoJC8RQ2tFbGc7JtZnIoGEPlX6z8/oEBShvEAAZEAqyQCFBufwws63bIaRkD+q697s4AGaEnR2GgFPn7XAxgQCTACokA5XYMyAjFAAyIAOX2/xnYx6Gq53QzzelzmgHkrbYFYMDGy78aA/5MbYkYsPHyr8aAP1NbIgZsvPyrMeDP1Jb4MmBr/041PzhKu8AABkQCrJAIUG6v3sAJQrN4MVh7N8cAAAAASUVORK5CYII=" ]) []


spanishFlag attrs =
    img (List.append attrs [ alt "flag image", src "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAuUlEQVRoQ+2ZOwqAMBAFk8qD2HoHz+4dbD2IVSz8QEghy1sSEsZ6P2ZmYYnG0PkTO3//wAFaG8QABkQCjJAIUE7/DBxLSHK1igXm/V4BHKAi9KwVBlqRf/tiAAMigWKE0jZ1tQfieuZ7gAOII2FNx4CVmHc8BryJWuthwErMOx4D3kSt9TBgJeYdP54Bvkp4z8hPPa6UlYEX7TCAAZHAeCMkAmmWzg+OZuifxhjAgEiAERIByundG7gAS75oMZXI6kQAAAAASUVORK5CYII=" ]) []
