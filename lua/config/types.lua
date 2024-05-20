vim.filetype.add({
    filename = {
        ['Jenkinsfile'] = 'groovy',
        ['*-playbook.yml'] = 'yaml-ansible',
        ['playbook.yml'] = 'yaml-ansible',
    }
})
