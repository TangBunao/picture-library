# 生成时间戳（格式：20250903_143000）
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

# JMeter 相关路径
$JMeterHome = "D:\Program Files\apache-jmeter-5.5"
$TestPlan   = ".\test_plan.jmx"
$ResultDir  = ".\results\$timestamp"
$LogFile    = "$ResultDir\jmeter.log"
$JTLFile    = "$ResultDir\results.jtl"
$ReportDir  = "$ResultDir\report"

# 创建结果目录
New-Item -ItemType Directory -Force -Path $ResultDir | Out-Null

# 执行 JMeter (非 GUI)
& "$JMeterHome\bin\jmeter.bat" -n -t $TestPlan -l $JTLFile -j $LogFile -e -o $ReportDir

Write-Host "✅ 测试完成，报告目录：" $ReportDir
