
function ExecuteApiCall {
    param (
        [string]$key
    )

    $jsonObject  = ReadPayloadFromFile


    switch ($key.ToUpper()) {
        "TEST" {
            $result = Invoke-RestMethod -Uri $jsonObject.TEST.url -Method Post -Body ($jsonObject.TEST.payload | ConvertTo-Json) -ContentType "application/json"       
            return $result.Token  | Out-String
        }
        "PROD" {
            $result = Invoke-RestMethod -Uri $jsonObject.PROD.url -Method Post -Body ($jsonObject.PROD.payload | ConvertTo-Json) -ContentType "application/json"       
            return $result.Token  | Out-String
        }
        "UAT" {
            $result = Invoke-RestMethod -Uri $jsonObject.UAT.url -Method Post -Body ($jsonObject.UAT.payload | ConvertTo-Json) -ContentType "application/json"       
            return $result.Token  | Out-String
        }
        default {
            return "fuck this."
        }
    }
}

function ReadPayloadFromFile{
    # Get the directory of the current executing script
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

    #have to hard cod this which is unfortunate. 
    $scriptDir ='C:\Users\hurstc\Documents\WindowsPowerShell\Modules\localsecurity\'

    # Define the path to your JSON file
    $jsonFilePath = Join-Path -Path $scriptDir -ChildPath "payloads.json"

    # Read the JSON file content
    $jsonContent = Get-Content -Path $jsonFilePath -Raw

    # Convert the JSON content to a PowerShell object
    $jsonObject = $jsonContent | ConvertFrom-Json

    # Output the JSON object
    return $jsonObject

}


function GetToken{
    param (
        [string]$key
    )

    $response = ExecuteApiCall -key $key

    Set-Clipboard $response

    return $response
}

$exportModuleMemberParams = @{
    Function = @(
        'GetToken'
    )
    Variable = @()
}

Export-ModuleMember @exportModuleMemberParams