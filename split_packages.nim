import std/[os, json]


proc splitPackagesJson(packagesJsonFile: string) =
  createDir("packages")
  let packagesJson = parseJson(readFile(packagesJsonFile))
  for pkg in packagesJson:
    let name = pkg.getOrDefault("name").getStr()
    writeFile("packages" / name & ".json", pretty(pkg))

when isMainModule:
  splitPackagesJson("packages.json")

