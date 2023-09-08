import std/[algorithm, json, os, sequtils]


proc createPackagesJson(packagesDir: string, packagesJsonFile: string) =
  var packagesJson = newJArray()
  var packageFiles = sorted(toSeq(walkDir(packagesDir)))

  for (_,path) in packageFiles:
    try:
      let packageJson = parseJson(readFile(path))
      packagesJson.add packageJson
    except JsonParsingError as e:
      echo "failed to parse json for: " & path
      echo e.msg
      quit 1

  writeFile(packagesJsonFile, pretty(packagesJson))

when isMainModule:
  createPackagesJson("packages", "packages.json")

