This is stend OSPF

We have 3 Routers 

Our target this task:

1)How work frr

2)Using symmetric route and asymmetric

3)Configured ospf 

1)This is task i little automatisation. i don't have create 3 templates for ospf and write only one. This templayt bring gathering facts in ansible (-m setup)
2) if you have asymmetric routing or symmetric,default preferense, change vars
________________________________________________________________________________

If i have default prefernce, i choosing default_routing=false in vars

If i wana be asymmetric route, i choosing default_routing=true in vars

if i wana be symmetric route and cost 1000 i choosing symmetric_routing=true
_________________________________________________________________________________


Full install and commit [ReadME](https://github.com/tulamelkii/otus/blob/ospf/Read)





![image](https://github.com/tulamelkii/otus/assets/130311206/68322138-334d-4714-aa72-b3368f0ab728)



* i have save function tags for ansible if i forget*

      - name: restart
        service:
          name: frr
          state: restarted
          enabled: true
        tags:
          - setup_ospf
          
* ansible-playbook -i host main.yml -t setup_ospf

