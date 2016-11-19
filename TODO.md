TODO

 Build an ipfs-action integration for Jasonette

 This, to be able to host jasonette apps directly from ipfs

 We will have a lot of links of ipfs hosts like ipfs infura / ipfs.io / ipfs oraclize etcetc. and other "big" ipfs host

 a code that randomizes


 ----

 integration notes


 -----



 ---

 notes from @ethan / @gl

 for an IPFS version of Jasonette based entirely (normal jsonette enable support for IPFS)

 IFPS Action in Jsonette - #jsonette #integration

 1. Write an JasonIpfsAction which converts a ipfs hash into an `url`
 2. Write a seed JSON and open it as data-uri (so it doesn’t need to be hosted anywhere)
 3. And in that seed JSON you make a $network.request call to the ipfs url we acquired from step 1.


 (note: sounds cool! #TODOs)
