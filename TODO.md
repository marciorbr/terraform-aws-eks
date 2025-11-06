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

feat(karpenter): Adiciona suporte a eventos SQS para o Karpenter
    
    Este commit aprimora a integração do Karpenter, adicionando o suporte a eventos via SQS para otimizar o gerenciamento do ciclo de vida das instâncias EC2.
    
    - Cria uma fila SQS (`sqs_karpenter.tf`) para receber notificações de eventos do EC2.
    - Configura regras do CloudWatch Events para capturar eventos relevantes, como interrupções de instâncias Spot, rebalanceamento e término de instâncias.
    - Direciona os eventos do CloudWatch para a fila SQS, permitindo que o Karpenter reaja proativamente a mudanças no ambiente.
    - Torna a criação de todos os recursos relacionados ao Karpenter (IAM, Helm, SQS) condicional, com base na variável `karpenter_capacity`, permitindo    desativar o Karpenter completamente se a variável estiver vazia.
    - Atualiza a documentação e a lista de tarefas.