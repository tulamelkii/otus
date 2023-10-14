This is sten ospf

We have 3 Routers

Our target this task:

1)How work frr

2)Using simmetric route and asimmetric

3)Configured ospf 



![image](https://github.com/tulamelkii/otus/assets/130311206/68322138-334d-4714-aa72-b3368f0ab728)



* i have save function tags for ansible if i forget*
  
* - name: tamplates frr
    
      template:
    
        src: templ.j2
    
        dest: /etc/frr/frr.conf
    
        owner: frr
    
        group: frr
    
        mode: 0644
    
      tags:
     
        - setup_ospf

    - name: restart
      
      service:
      
        name: frr
      
        state: restarted
      
        enabled: true
      
      tags:
      
        - setup_ospf
          
and play localadm@DEB:~/otus$ ansible-playbook -i host main.yml -t setup_ospf

[WARNING]: Found both group and host with same name: Router1

[WARNING]: Found both group and host with same name: Router3

[WARNING]: Found both group and host with same name: Router2

PLAY [install all hosts] *****************************************************

TASK [Gathering Facts] *******************************************************

ok: [Router3]

ok: [Router1]

ok: [Router2]

TASK [tamplates frr] *********************************************************

ok: [Router3]

ok: [Router2]

ok: [Router1]

TASK [restart] ***************************************************************

changed: [Router3]

changed: [Router2]

changed: [Router1]

PLAY RECAP *******************************************************************

Router1                    : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Router2                    : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Router3                    : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
