# Lista de Tarefas do Projeto

- [x] criar fargate profile
- [x] Configurar karpenter
- [ ] Configurar Addon Pod Identity
- [ ] Alterar fargate e karpenter para Pod Identity

- [ ] ajustar - eks-node-instance-profile${local.name_suffix} e verificar todos os outros nome se está faltando
- [ ] KMS no cluster para encriptar secrets
- [ ] dar acesso de admin no cluster a uma IAM role passada como variável
- [ ] criar node groups spot
- [ ] criar cluster autoscaler para node groups on demand
- [ ] Configurar monitormanento prometheus e karpenter