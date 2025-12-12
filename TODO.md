# Lista de Tarefas do Projeto

- [x] criar fargate profile
- [x] Configurar karpenter
- [x] Configurar Addon Pod Identity
- [x] Alterar fargate e karpenter para Pod Identity
- [x] remover configurações de acesso ao cluster por OIDC, deixar só access entry
- [x] configurar permissões só por Pod Identity, remover por IRSA
- [x] ajustar - eks-node-instance-profile${local.name_suffix} e verificar todos os outros nome se está faltando
- [ ] parametrizar por variable as configurações de access entry para permitir acesso ao cluster
- [ ] parametrizar entradas "ingress" no cluster_security_group do cluster.
- [ ] alterar configurações do nginx ingress controle para api gateway
- [ ] KMS no cluster para encriptar secrets