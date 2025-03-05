function Hello {
    param (
        [string]$Data
    )
    # Your code to set data in Salesforce
    Write-Output "Setting data: $Data"
}


function checksalesforceruns {
    # Database connection details
    $server = "WINPRDAB1348"
    $database = "cornmarketonline"
    
    try {
        # Create a SQL Server connection using Windows authentication
        $conn = New-Object System.Data.SqlClient.SqlConnection
        $conn.ConnectionString = "Server=$server;Database=$database;Integrated Security=True;"
        $conn.Open()
    
        # Create a SQL command and execute the query
        $cmd = New-Object System.Data.SqlClient.SqlCommand
        $cmd.Connection = $conn
        $cmd.CommandText = "SELECT TOP 10 id, status, activityname, startedonutc, completedonutc FROM salesforce.ATCStateActivity ORDER BY id desc"
        $reader = $cmd.ExecuteReader()
    
        # Create an array to store the results
        $results = @()
    
        # Loop through the results and add them to the array
        while ($reader.Read()) {
            $result = [PSCustomObject]@{
                Id = $reader.GetInt64(0)
                Status = $reader.GetString(1)
                ActivityName = $reader.GetString(2)
                StartDate = $reader.GetDateTime(3)
                CompleteDate = $reader.GetDateTime(3)
            }
    
            Write-Host "activityname: $($result.ActivityName) startdate: $($result.StartDate.ToString('dd/MM/yyyy'))"
            $results += $result
        }
    
        # Close the connection
        $reader.Close()
        $conn.Close()
    
        
    } catch {
        Write-Host "An error occurred: $($_.Exception.Message)"
    }
}




function checkmfilespending {
    # Database connection details
    $server = "WINPRDAB1348"
    $database = "AutoMail"
    
    try {
        # Create a SQL Server connection using Windows authentication
        $conn = New-Object System.Data.SqlClient.SqlConnection
        $conn.ConnectionString = "Server=$server;Database=$database;Integrated Security=True;"
        $conn.Open()
    
        # Create a SQL command and execute the query
        $cmd = New-Object System.Data.SqlClient.SqlCommand
        $cmd.Connection = $conn
        $cmd.CommandText = "select d.ClientNumber, d.PolicyPrimaryKey, s.RetryCount, s.RetryReason, s.NextRetryAt from mfiles.DocumentMetadata d join mfiles.SyncRetryTracker s on d.UniqueDocId = s.UniqueDocId where s.IsActive =1 order by s.NextRetryAt asc"
        $reader = $cmd.ExecuteReader()
    
        # Create an array to store the results
        $results = @()
    
        # Loop through the results and add them to the array
        while ($reader.Read()) {
            $result = [PSCustomObject]@{
                clientId = $reader.GetString(0)
                PolicyPrimaryKey = $reader.GetString(1)
                RetryCount = $reader.GetInt16(2)
                RetryReason = $reader.GetString(3)
                NextRetry = $reader.GetDateTime(4)
            }
    
            Write-Host "clientId:$($result.clientId) primarykey:$($result.PolicyPrimaryKey) RetryCount:$($result.RetryCount) Reason:$($result.RetryReason) NextRetry:$($result.NextRetry.ToString('dd/MM/yyyy'))"
            $results += $result
        }
    
        # Close the connection
        $reader.Close()
        $conn.Close()
    
        
    } catch {
        Write-Host "An error occurred: $($_.Exception.Message)"
    }
}


$exportModuleMemberParams = @{
    Function = @(
        'Hello', 'checksalesforceruns','checkmfilespending'
    )
    Variable = @()
}

Export-ModuleMember @exportModuleMemberParams