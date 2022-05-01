type adId = Zone01 | Zone02 | Zone03 | Zone04 | Zone05 | Zone06

module MockLeaderboardAd = {
  @react.component
  let make = (~id: string, ~className: string) => {
    <div
      style={ReactDOM.Style.make(~width="728px", ~height="90px", ())}
      className={"flex items-center justify-center bg-gray-100 text-gray-400 " ++ className}>
      {id->React.string}
    </div>
  }
}

module MockMediumAd = {
  @react.component
  let make = (~id: string, ~className: string) => {
    <div
      style={ReactDOM.Style.make(~width="300px", ~height="250px", ())}
      className={"flex items-center justify-center bg-gray-100 text-gray-400 " ++ className}>
      {id->React.string}
    </div>
  }
}

@react.component
let make = (~adId: adId) => {
  switch adId {
  | Zone01 => <MockLeaderboardAd id="cdm-zone-01" className="hidden md:flex" /> // 728x90 desktop only
  | Zone02 => <MockMediumAd id="cdm-zone-02" className="" /> // 300x250 desktop and mobile
  | Zone03 => <MockMediumAd id="cdm-zone-03" className="" /> // 300x250 desktop and mobile
  | Zone04 => <MockLeaderboardAd id="cdm-zone-04" className="hidden md:flex" /> // 728x90 desktop only
  | Zone05 => <MockLeaderboardAd id="cdm-zone-05" className="hidden md:flex" /> // 728x90 desktop only
  | Zone06 => <MockMediumAd id="cdm-zone-06" className="md:hidden" /> // 300x250 mobile only
  }
}
