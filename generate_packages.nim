import std/[algorithm, json, os, sequtils]


proc createPackagesJson(packagesDir: string, packagesJsonFile: string) =
  var packagesJson = newJArray()
  var packageFiles = sorted(toSeq(walkDir(packagesDir)))


  for (_,path) in packageFiles:
    let packageJson = parseJson(readFile(path))
    packagesJson.add packageJson

  writeFile(packagesJsonFile, pretty(packagesJson))

when isMainModule:
  createPackagesJson("packages", "packages.json")

