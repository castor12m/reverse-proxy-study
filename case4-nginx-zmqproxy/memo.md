

## 1. 

- 다른 server에서 api call.

```
curl -X GET "http://192.168.35.126:8080/api/test"
```


- 질문
    - nginx.conf (최종 통합 버전) 으로 했는데, 
    - Test-NetConnection -ComputerName 192.168.35.126 -Port 7000 이렇게 보내도
    - 차단된 ip에서 송신해도 계속 다음과 같이 떠

"""
 Test-NetConnection -ComputerName 192.168.35.126 -Port 7000


ComputerName     : 192.168.35.126
RemoteAddress    : 192.168.35.126
RemotePort       : 7000
InterfaceAlias   : 이더넷
SourceAddress    : 192.168.35.92
TcpTestSucceeded : True
"""

- 답변

```
🚀 최종 정리
✅ NGINX stream 블록에서는 allow / deny 규칙이 TCP 레벨에서 완벽하게 동작하지 않을 수 있음.
✅ 가장 확실한 방법은 iptables를 사용하여 직접 특정 IP만 7000 포트에 접근 가능하도록 설정하는 것.
✅ 설정 적용 후 iptables -L -v -n로 확인하고, Test-NetConnection으로 테스트!
```