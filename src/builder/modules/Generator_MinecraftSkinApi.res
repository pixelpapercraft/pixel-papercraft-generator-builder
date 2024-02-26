// https://github.com/Electroid/mojang-api
// https://wiki.vg/Mojang_API

module User = {
  // Example:
  //
  // {
  //   "uuid": "8667ba71-b85a-4004-af54-457a9734eed7",
  //   "username": "Steve",
  //   "username_history": [
  //       {
  //           "username": "Steve"
  //       }
  //   ],
  //   "textures": {
  //       "custom": true,
  //       "slim": false,
  //       "skin": {
  //           "url": "http://textures.minecraft.net/texture/60a5bd016b3c9a1b9272e4929e30827a67be4ebb219017adbbc4a4d22ebd5b1",
  //           "data": "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"
  //       },
  //       "cape": {
  //           "url": "http://textures.minecraft.net/texture/953cac8b779fe41383e675ee2b86071a71658f2180f56fbce8aa315ea70e2ed6",
  //           "data": "iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAAOwwAADsMBx2+oZAAAAAd0SU1FB98KBgk2H0ui5CgAAAMpSURBVGje7Zg/axtJGIef2VkFicQg7lhisiyoUZdKJqS5Kw3XOfgjpE3hFMkXSJsmKdznI9hpElB5RRLCqbsmgkOwkROzJBhikNDO7qRYz2il+I8k7/oC2QeEFlbMzPub3zvvOxIAz6+5upekHGrNadwUgo50eDJRLMIXECzIP43azKQff0sBGETZEDsTtfBYq+D+5QgNsL0uGEQOvSS1LzvSAaDlaQYR3HEE/50hUp7fQX/QLLXwjVGc/X7IleICWdCRQ8vT/PFVMr8jg0jMCFMkJvB5J8y7oSwnuAAemlcqgU8AKTfFdK7DT9m6bgs4vIIdMUHnaXmafaTeGiaFi+AABFLOBn1icw/NbcHMu7KwKQC0gwbtoGF3fxAJ/v6c8kgKXYoABhOsOfQCKQlklhLm+zT8gnf/6JuyQrQ8bec/bw2XSgFDICVRkuKh+T+JjmIAmmsu7aCB18xVn39VOQ7YXhfsxoo36TQHd2PFbqzYXhdXErgpfUYE44Tmmms/+77UhQsQJonNOT9ndz+XkxdRVBp4zdqpInR7Y7q9MaWdAd3emL27N9hwhN35DUewd/fGmRP7JbiguebiNWtWiOgoptsbEybJwpux9BkQISBJ6PbGvEynDnuZav4MR4Ql9QDniWB431eESUIgJZudenkOMPXW7Kx/Sbs/v+Yunas7EyXybnvfz+x//851Njt1+uGIfjhaaewLq0CW9xofeHhL0g4aPHh3bN8ZC15FGvTDEYMoS0UArCiiPAe0PE07aHCvNrVf/nkRihIjn+f+XEXai5V1aqGtsFHXWM08Z+VpvHSwm506vD1eekEmuM1OndbJOh4fKDvnvZpLO6jD8LhYB5x3uhap+KJ0e+OZvmA+RQq/C1zEom2onwtgFbaGiT0Id2PFs4OEByepOAT2YnWmMCulwOtUi9cT9aNdz7HYh8XGvpRtWp6Gg+nfA09vyR+6xcLvAj8L5kB+0VQn9wJtgz+rGhXSBxQdxKpsDRPRD0e2K8yPWfStsDQBLtuyGqvPt8YtTxdfBn9GdiZK7IcjPYiELcf5FrmoMlhRUVFRUVFRUfGr8h1KVExpP3QPdAAAAABJRU5ErkJggg=="
  //       },
  //       "raw": {
  //           "value": "ewogICJ0aW1lc3RhbXAiIDogMTY1ODU0Nzg0NjM1NywKICAicHJvZmlsZUlkIiA6ICI4NjY3YmE3MWI4NWE0MDA0YWY1NDQ1N2E5NzM0ZWVkNyIsCiAgInByb2ZpbGVOYW1lIiA6ICJTdGV2ZSIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS82MGE1YmQwMTZiM2M5YTFiOTI3MmU0OTI5ZTMwODI3YTY3YmU0ZWJiMjE5MDE3YWRiYmM0YTRkMjJlYmQ1YjEiCiAgICB9LAogICAgIkNBUEUiIDogewogICAgICAidXJsIiA6ICJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzk1M2NhYzhiNzc5ZmU0MTM4M2U2NzVlZTJiODYwNzFhNzE2NThmMjE4MGY1NmZiY2U4YWEzMTVlYTcwZTJlZDYiCiAgICB9CiAgfQp9",
  //           "signature": "HsyizFk54LzWSUVfiaJeGJaluTzsuthnlByet8rlXdWDp4tMSFFBMHoIh4zdbu30LBmPem26DCv7LJ6f2SJdPxclPufWdWJs2W4aYEe1YsXLs2hDoT8QX2iy8A4sY1DuGhQb20msN+wYk0JrDpDmpNjGJzgXxsyg/7kVbuwL8UDc7b/QeRg+s/BIOmXXSXpZa7EosxDT5wSw9dTkPnNVzkTvPBOammEtDWpV2s9XPgYZjzCcwqUBP3crB98BSWrJJqGrlLrIr8qVKlmBbPLJJI6et4FB0O4MKG1YdgrNqHvnFupt0glmcyw4mXIg4vyMNTkKyZlISm6g1cJP46VjdrVQFc+O1jL5LisFCaOxCxY/cAG37cn+D3G/zzrniE2K9Ykn+DELMPrvJh9PXyV79T83JZuIjrVX/qRHxZMmp8ZFTxIyu4OpRAH9dCM3x+8LJqe4d+RSN/oFA2Gz8JWLBkG8Ek7IVM2V+g7pBQ18CHVWMUuPB/QY5kQua/03SiiCQBy0aK3R/ztJcjsCPa4svCmrz0K97kKwacd8BeVbz71fDyfO4BlOopqXZdQvOUEEJY4nKXGfcw0nskU+BXC+EFcYnRRPs7wYyKOteT9UWSNbqRK3lTraRg0jlrq4IUyUyoHcWrTM7KxZBVAWDyuD88YjBpwTk5uL/4RMHJrHMYA="
  //       }
  //   },
  //   "created_at": "2010-08-28"
  // }

  module Texture = {
    type t = {
      url: string,
      data: string,
    }

    let codec = Jzon.object2(
      ({url, data}) => (url, data),
      ((url, data)) => Ok({url, data}),
      Jzon.field("url", Jzon.string),
      Jzon.field("data", Jzon.string),
    )
  }

  module Textures = {
    type t = {custom: bool, slim: bool, skin: Texture.t} //, cape: Texture.t}

    let codec = Jzon.object3(
      ({custom, slim, skin}) => (custom, slim, skin),
      ((custom, slim, skin)) => Ok({custom, slim, skin}),
      Jzon.field("custom", Jzon.bool),
      Jzon.field("slim", Jzon.bool),
      Jzon.field("skin", Texture.codec),
      //Jzon.field("cape", Texture.codec),
    )
  }

  type t = {uuid: string, username: string, createdAt: string, textures: Textures.t}

  let codec = Jzon.object4(
    ({uuid, username, createdAt, textures}) => (uuid, username, createdAt, textures),
    ((uuid, username, createdAt, textures)) => Ok({
      uuid,
      username,
      createdAt,
      textures,
    }),
    Jzon.field("uuid", Jzon.string),
    Jzon.field("username", Jzon.string),
    Jzon.field("created_at", Jzon.string),
    Jzon.field("textures", Textures.codec),
  )
}

let makeError: string => exn = %raw(`
  function makeError(message) {
    return new Error(error)
  }
`)

let getSkinImage = username => {
  let apiUrl = "https://api.ashcon.app/mojang/v2/user/" ++ username
  Fetch.fetchJson(apiUrl)
  ->Promise.then(Fetch.json)
  ->Promise.then(json => {
    let user = json->Jzon.decodeWith(User.codec)
    switch user {
    | Error(_) =>
      let skinUrl = "data:image/png;base64,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" //"https://api.ashcon.app/mojang/v2/user/NinjolasNJM" //"data:image/png;base64," ++ steveData
      //Js.Console.log(json)
      Generator_ImageFactory.makeFromUrl(skinUrl)

    | Ok(user) => {
        let skinUrl = "data:image/png;base64," ++ user.textures.skin.data
        //Js.Console.log(json)
        Generator_ImageFactory.makeFromUrl(skinUrl)->Promise.then(image =>
          Generator_Converter.convert(image)
        )
      }
    }
  })
}
